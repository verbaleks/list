require 'digest/md5'

class User < ActiveRecord::Base
	before_create :generate_code
	after_create :send_confirmation

	attr_accessible :first_name, :last_name, :login, :password, :email, :password_confirmation
	attr_accessor :password_confirmation
	has_many :categories
	has_many :tasks

	validates :first_name, :presence => true
	validates :last_name, :presence => true
	validates :login, :presence => true, :uniqueness => true 
	validates :password, :presence => true, :length => { :minimum => 3 }, :confirmation => true
	validates :email, :presence => true, :format => { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }

private
	def generate_code
		self.code = Digest::MD5.hexdigest(Time.now.to_s.split(//).sort_by{rand}.join)
	end

def send_confirmation
		Usermailer.reg_con(self).deliver
	end
end
