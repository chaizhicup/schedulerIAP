class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  #<><><><>!!!!!!!!!!!! Comment this out for rspec !!!!!!!!!!!!!!!  
  before_filter :authorize, only: [:destroy, :index], :except => :new_session_path

  $stu_slot = Hash.new([])
  $students = Student.all.order(:UIN)
  $selected_slots = Hash.new([])
  $event_slots = Hash.new([])

  # GET /students
  # GET /students.json

  def index
    
    @events = Event.where("for_student = true").pluck(:id,:name)
    $students = Student.all.order(:UIN)
      $students.each do |x|
      @arr = Hash.new([])
      @tslots = x.timeslots
        @events.each do |ev|
            @check = FALSE
            @tslots.each do |t|
              if(t.event_id == ev[0])
                @arr[ev[1]] = (t.start_time.strftime("%I:%M%p") + "-" + t.end_time.strftime("%I:%M%p"))
                @check = TRUE
                break
              end
             end
           if(@check == FALSE)
             @arr[ev[1]] = ("Not Attend")
           end
         end
       $stu_slot[x.id] = @arr
       end
  end

  # GET /students/1
  # GET /students/1.json
  def show
   
    unless log_in? || cus_indentify(get_id)
      flash[:danger] = "Please Log in!"
      redirect_to new_session_path
    end
  #change
    @events = Event.where("for_student = true").pluck(:id,:name)
    $students = Student.all.order(:UIN)
      $students.each do |x|
      @arr = Hash.new([])
      @tslots = x.timeslots
        @events.each do |ev|
            @check = FALSE
            @tslots.each do |t|
              if(t.event_id == ev[0])
                @arr[ev[1]] = (t.start_time.strftime("%I:%M%p") + "-" + t.end_time.strftime("%I:%M%p"))
                @check = TRUE
                break
              end
             end
           if(@check == FALSE)
             @arr[ev[1]] = ("Not Attend")
           end
         end
       $stu_slot[x.id] = @arr
       end
  #change end
  end

  # GET /students/new
  def new
    @event_details = Event.where("for_student = true").pluck(:id, :name, :event_date, :start_time, :end_time)
    @student = Student.new
    
    @event_slot = Hash.new([])
    
    
    @events = Event.where("for_student = true").pluck(:id)
    @events.each do |id|
    @event, @event_slot = set_menu(id)
    $selected_slots[id] = -1	
    $event_slots[id] = @event_slot
    end
    
  end

  # GET /students/1/edit
  def edit
    if log_in? || cus_indentify(get_id)
    @event_details = Event.where("for_student = true").pluck(:id, :name, :event_date, :start_time, :end_time)
    @events = Event.where("for_student = true").pluck(:id, :name)
     @student.timeslots.each do |x| 
      $selected_slots[x.event_id] = x.id
    end

    @events = Event.where("for_student = true").pluck(:id)
    @events.each do |id|
    @event, @event_slot = set_menu(id)
    $event_slots[id] = @event_slot
    end

    else
      flash[:danger] = "Please Log in!"
      redirect_to new_session_path
    end
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(student_params)
    @event_details = Event.where("for_student = true").pluck(:id, :name, :event_date, :start_time, :end_time)

    @events = Event.where("for_student = true").pluck(:id, :name)
    @events.each do |id,name|
      $selected_slots[id] = params[name]
    end
    
    @event_slots = Hash.new([])
    respond_to do |format|
      if @student.save
        input_session(@student.id)
	
	Timeslot.decrease_1(@student.id)

	@events = Event.where("for_student = true").pluck(:id,:name)
	@events.each do |id,name|
          temp1, temp2 = set_menu(id)
	  if(params[name] != "0"  && !params[name].nil? && !params[name].empty?)
	    @student.timeslots << Timeslot.find(params[name])
	  end
    	end

	#@selected_slots.each { |k, v| puts "Key=#{k}, Value=#{v}"}

#change
    @events = Event.where("for_student = true").pluck(:id,:name)
    $students = Student.all.order(:UIN)
      $students.each do |x|
      @arr = Hash.new([])
      @tslots = x.timeslots
        @events.each do |ev|
            @check = FALSE
            @tslots.each do |t|
              if(t.event_id == ev[0])
                @arr[ev[1]] = (t.start_time.strftime("%I:%M%p") + "-" + t.end_time.strftime("%I:%M%p"))
                @check = TRUE
                break
              end
             end
           if(@check == FALSE)
             @arr[ev[1]] = ("Not Attend")
           end
         end
       $stu_slot[x.id] = @arr
       end
  #change end

        UserMailer.stu_reg(@student).deliver_now

        format.html { redirect_to @student, notice: 'Student was successfully created.' }
        format.json { render :show, status: :created, location: @student }
      else

	@events = Event.where("for_student = true").pluck(:id)
	@events.each do |id|
        @event, @event_slot = set_menu(id)
	@event_slots[id] = @event_slot
    	end

        flash[:notice] = @student.errors.full_messages
        format.html { render :new } 
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    respond_to do |format|
    @event_details = Event.where("for_student = true").pluck(:id, :name, :event_date, :start_time, :end_time)
      
      @events = Event.where("for_student = true").pluck(:id, :name)
      @events.each do |id,name|
        $selected_slots[id] = params[name]
      end

	Timeslot.increase_1(@student.id)
	@student.timeslots = []
	@events = Event.where("for_student = true").pluck(:name)
	@events.each do |name|
	if(params[name] != "0"  && !params[name].nil? && !params[name].empty?)
	    @student.timeslots << Timeslot.find(params[name])
	 end
	
    	end
      if @student.update(student_params)
        UserMailer.stu_reg(@student).deliver_now
	Timeslot.decrease_1(@student.id)

	        
        
        format.html { redirect_to @student, notice: 'Student was successfully updated.' }
        format.json { render :show, status: :ok, location: @student }
      else
	@events = Event.where("for_student = true").pluck(:id,:name)
	@events.each do |id,name|
          temp1, temp2 = set_menu(id)
	  Timeslot.decrease_1_id(temp1, @student.id, name)
    	end
        
        flash[:notice] = @student.errors.full_messages
        format.html { redirect_to edit_student_path}
        format.json { render json: @student.errors, status: :unprocessable_entity }

      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: 'Student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    
    def set_menu(arg)
      result_slots= Timeslot.where("event_id = ? AND stunum > 0", arg).collect{|item| [item.id, item.start_time, item.end_time, item.stunum]}
      slots = Hash.new([])
      slots['Not Attend'] = 0

        result_slots.each do |item|
          slots[item[1].strftime("%I:%M%p") + "-" + item[2].strftime("%I:%M%p")] = item[0]
        end
	slots  = slots.sort
      return result_slots, slots
    end

    # Use callbacks to share common setup or constraints between actions.
    def get_id
      params[:id]
    end

    def set_student
      @student = Student.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit(:name, :UIN, :email, :US_Citizen, :degree, :position_type, :Mock_1)
    end

end
