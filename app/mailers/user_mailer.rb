class UserMailer < ApplicationMailer

	default from: '2015_IAP@cse.tamu.edu'

	def stu_reg(arg)
		@user = arg
		# Get full url, not just path
		url = Rails.application.routes.url_helpers.edit_student_url(@user)
		uri = URI.parse(url)
  		uri.query = URI.encode_www_form( {'edithash' => @user.edithash} )
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
	
	def stu_reminder(arg)
		@app = arg
		stu = @app.UIN
		@user = Student.find_by! UIN: stu
		begin
			@event = Event.find_by! name: @app.section
		rescue ActiveRecord::RecordNotFound
			raise ArgumentError
		rescue Exception => e
			logger.error(e.message)  
        	puts e.backtrace.inspect
			raise 'UnknownEventError'
		end
		
		if @user.email.split('@')[1] == "tamu.edu"
			a = @user.email.split('@')[0]
			@user.email = a + "@email.tamu.edu"
		end
			mail(to: @user.email, subject: 'Event Reminder!')
	end
end
