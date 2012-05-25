class User < ActiveRecord::Base
	attr_accessible :first_name, :last_name, :login, :password, :email, :password_confirmation
	attr_accessor :password_confirmation
	has_many :categories

	validates :first_name, :presence => true
	validates :last_name, :presence => true
	validates :login, :presence => true, :uniqueness => true 
	validates :password, :presence => true, :length => { :minimum => 3 }, :confirmation => true
	validates :email, :presence => true, :format => { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }
end
