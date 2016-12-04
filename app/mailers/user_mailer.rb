class UserMailer < ApplicationMailer

	default from: '2015_IAP@cse.tamu.edu'

	def stu_reg(arg)
		@user = arg
		uri = URI.parse(Rails.application.routes.url_helpers.edit_student_path(student))
  		uri.query = URI.encode_www_form( {'edithash' => student.edithash} )
  		@editlink = uri.to_s
		if @user.email.split('@')[1] == "tamu.edu"
			a = @user.email.split('@')[0]
			@user.email = a + "@email.tamu.edu"
		end
		mail(to: @user.email, subject: 'Confirmation for Registration')
	end

	def com_reg(arg)
		@user = arg
		if @user.contact_email.split('@')[1] == "tamu.edu"
			a = @user.contact_email.split('@')[0]
			@user.contact_email = a + "@email.tamu.edu"
		end
		mail(to: @user.contact_email, subject: 'Confirmation for Registration')
	end

	def stu_del(arg)
		@user = arg
		if @user.email.split('@')[1] == "tamu.edu"
			a = @user.email.split('@')[0]
			@user.email = a + "@email.tamu.edu"
		end
		mail(to: @user.email, subject: 'Registration Cancelled')
	end

	def com_del(arg)
		@user = arg
		if @user.contact_email.split('@')[1] == "tamu.edu"
			a = @user.contact_email.split('@')[0]
			@user.contact_email = a + "@email.tamu.edu"
		end
		mail(to: @user.contact_email, subject: 'Registration Cancelled')
	end
end
