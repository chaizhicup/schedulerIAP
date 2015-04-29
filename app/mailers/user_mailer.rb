class UserMailer < ApplicationMailer

	default from: '2015_IAP@cse.tamu.edu'
 
  def welcome_email(arg)
    @user = arg
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end

  def stu_reg(arg)
	@user = arg
	if @user.email.split('@')[1] == "tamu.edu"
		a = @user.email.split('@')[0]
		@user.email = a + "@email.tamu.edu"
	end
		mail(to: @user.email, subject: 'Welcome to My Awesome Site')
end

end
