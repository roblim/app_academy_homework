class UserMailer < ApplicationMailer
  default from: 'info@puppyboy.com'

  def welcome_email(user)
    @user = user
    @url = 'http://www.geometric.com/login'
    mail(to: user.email, subject: 'Welcome to geometric.com\'s premiere spam mailing list!')
  end

end
