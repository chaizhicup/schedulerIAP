class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]

  before_filter :authorize, only: [:index, :destroy, :new, :show], :except => :new_session_path
  # GET /appointments
  # GET /appointments.json
  def index
    @appointments = Appointment.all.order(:section)
  end

  # GET /appointments/1
  # GET /appointments/1.json
  def show
  end

  # GET /appointments/new
  def new
    @appointment = Appointment.new
  end

  # GET /appointments/1/edit
  def edit
  end

  # POST /appointments
  # POST /appointments.json
  def create
    @appointment = Appointment.new(appointment_params)

    respond_to do |format|
      if @appointment.save
        format.html { redirect_to @appointment, notice: 'Appointment was successfully created.' }
        format.json { render :show, status: :created, location: @appointment }
      else
        format.html { render :new }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /appointments/1
  # PATCH/PUT /appointments/1.json
  def update
    respond_to do |format|
      if @appointment.update(appointment_params)
        format.html { redirect_to @appointment, notice: 'Appointment was successfully updated.' }
        format.json { render :show, status: :ok, location: @appointment }
      else
        format.html { render :edit }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appointments/1
  # DELETE /appointments/1.json
  def destroy
    @appointment.destroy
    respond_to do |format|
      format.html { redirect_to appointments_url, notice: 'Appointment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  helper_method :generate

  def generate
    @studentfinish = []
    @errormessage = ["Error timeslot Below:"]
    Appointment.delete_all

    events = Event.all
    events.each do |event|
      matchappsection(event)
    end

    flag = 0
    puts 'check if all student finish'
    print @studentfinish
    @studentfinish.each do |x|
      if x == true
        flag = 1;

      end
    end
    if flag == 0
      redirect_to appointments_url, notice: 'Appointment was successfully generated.'
    else
      redirect_to appointments_url, notice: 'Appointment was successfully generated, however lack of company, some student failed, check your company status'
      #flash[:notice] =  "Appointment was generated, Some students failed to generate an appointment due to the lack of campany represents for the following time slots"
      flash[:notice] = @errormessage
    end
  end


  ################################################################
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def appointment_params
    params.require(:appointment).permit(:section, :time_slot, :company, :student, :UIN)
  end

  ###############################################################
  def matchappsection(event)

    slots = event.timeslots
    puts 'print time slot'
    puts slots
    slots.each do |timeslot|
      puts 'current select'
      puts timeslot
      puts ' '
      matchapp(timeslot, event)
      #matchapp('11:30am-12:30am', mockselect)
    end
  end


  ###############################################################
  def matchapp(timeslot, event)

    @students = timeslot.students.collect {|item| [item.name, item.UIN, item.email, item.US_Citizen, item.degree, item.position_type]}

    event_companies = event.companyevents.where("representatives > 0").collect {|item| [item.company_id, item.representatives]}

    @companyplat = {}
    @companygold = {}
    @companysilver = {}
    @companybronze = {}
    event_companies.each do |item|
      company = Company.find(item[0])
      if(company.sponsor_level == 'Platinum')
        @companyplat[company] = item[1]
      elsif(company.sponsor_level == 'Gold')
        @companygold[company] = item[1]
      elsif(company.sponsor_level == 'Silver')
        @companysilver[company] = item[1]
      elsif(company.sponsor_level == 'Bronze')
        @companybronze[company] = item[1]

      end

      if @companyplat.length>0 && @students.length>0
        matchappoint(timeslot, event, @companyplat)
      end

      if @companygold.length>0 && @students.length>0
        matchappoint(timeslot, event, @companygold)
      end

      if @companysilver.length>0 && @students.length>0
        matchappoint(timeslot, event, @companysilver)
      end

      if @companybronze.length>0 && @students.length>0
        matchappoint(timeslot, event, @companybronze)
      end

      @comremain = {}
      @comremain.merge!(@companyplat).merge!(@companygold).merge!(@companysilver).merge!(@companybronze)

      @comremain.delete_if{|_,x| !x.nil? and x<=0}

      if @comremain.length>0 && @students.length>0
        matchappointwithout(timeslot, event, @comremain)
      end

      finish = @students.length>0

      if @students.length > 0
        error = "#{event.name}"+ ':  '+ "#{timeslot.start_time}" + '-' + "#{timeslot.end_time}"
        #error = arg
        @errormessage << error
      end

      @studentfinish << finish
    end
  end


  ##############################################################
  def matchappointwithout(timeslot, event, companies)
    stuuin=[];
    totalrep = 0;
    companies.each do |com, representatives|
      totalrep += representatives
    end

    while @students.length > 0 && totalrep> 0 do
      @students.each do |student|
        companies.each do |item, representatives|

          if representatives > 0
            appointment = Appointment.new
            getone = student
            appointment.section = event.name
            appointment.time_slot = timeslot.start_time.strftime("%I:%M%p") + "-" + timeslot.end_time.strftime("%I:%M%p")
            appointment.company = item.name
            appointment.student = getone[0]
            appointment.UIN = getone[1]
            stuuin = stuuin << getone[1]
            representatives-=1
            totalrep-=1
            appointment.save
            break
          end
        end
      end
      stuuin.each do |uin|
        @students.delete_if {|x| x[1]==uin}
      end
    end

  end


  ###############################################################
  def matchappoint(timeslot, event, companies)
    stuuin=[];
    @students.each do |student|
      companies.each do |item, representatives|

        usif= item.citizenship=="US Citizen Only"? true:false
        conjobtype = item.job_type == student[5] || item.job_type == 'Any' || item.job_type == nil
        condegree = item.student_level == student[4] || item.student_level == 'Any' || item.student_level == nil
        concitizen = usif == student[3] || usif == false || usif == nil

        if (representatives > 0 && conjobtype && condegree && concitizen)
          getone = student

          appointment = Appointment.new
          appointment.section = event.name
          appointment.time_slot = timeslot.start_time.strftime("%I:%M%p") + "-" + timeslot.end_time.strftime("%I:%M%p")
          appointment.company = item.name
          appointment.student = getone[0]
          appointment.UIN = getone[1]
          stuuin = stuuin << getone[1]
          representatives-=1
          appointment.save
          break
        end
      end
    end

    stuuin.each do |uin|
      @students.delete_if {|x| x[1]==uin}
    end
  end
  ################################################################
end