class Usermailer < ActionMailer::Base
  default from: "verbaleks@gmail.com"

 def reg_con(user)
   @user = user
   mail(:to => user.email, :subject => "Registered")
 end
end
