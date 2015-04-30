class UserMailer < ApplicationMailer

	default from: '2015_IAP@cse.tamu.edu'

  def stu_reg(arg)
	@user = arg
	if @user.email.split('@')[1] == "tamu.edu"
		a = @user.email.split('@')[0]
		@user.email = a + "@email.tamu.edu"
	end
		mail(to: @user.email, subject: 'Confirmation for Registration.')
end

	def com_reg(arg)
		@user = arg
		if @user.contact_email.split('@')[1] == "tamu.edu"
			a = @user.contact_email.split('@')[0]
			@user.contact_email = a + "@email.tamu.edu"
		end
		mail(to: @user.contact_email, subject: 'Confirmation for Registration.')
	end

end
