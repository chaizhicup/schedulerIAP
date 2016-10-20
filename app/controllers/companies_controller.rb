class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]

#<><><><>!!!!!!!!!!!! Comment this out for rspec !!!!!!!!!!!!!!!  
  before_filter :authorize, only: [:destroy, :index], :except => :new_session_path
  # GET /companies
  # GET /companies.json
  def index
    @companies = Company.all.order(:name)
    @events = Event.where("for_company = true")
  end


  # GET /companies/1
  # GET /companies/1.json
  def show
    @reps = @company.companyevents.collect(&:representatives)
    unless log_in? || cus_indentify(get_id)
      flash[:danger] = "Please Log in!"
      redirect_to new_session_path
    end
  end


  # GET /companies/new
  def new
    @company = Company.new
    @company.companyevents.build

    @eves = Event.where("for_company = true").pluck(:id, :name, :event_date, :start_time, :end_time)
    @it = 0
    @new_flag = 1
    @reps = @company.companyevents.collect(&:representatives)
  end


  # GET /companies/1/edit
  def edit
    @eves = Event.where("for_company = true").pluck(:id, :name, :event_date, :start_time, :end_time)
    @it = 0
    @new_flag = 0
    eve_ids = Event.where("for_company = true").pluck(:id)
    company_events = @company.companyevents.collect(&:event_id)
    eve_ids.delete_if { |x| company_events.include?(x) }
    if !eve_ids.empty? 
      eve_ids.each do |id|
        @company.companyevents.create(:company_id => @company.id, :event_id => id, :representatives => 0)
      end
    end

    @reps = @company.companyevents.collect(&:representatives)

    unless log_in? || cus_indentify(get_id)
      flash[:danger] = "Please Log in!"
      redirect_to new_session_path
    end
  end


  # POST /companies
  # POST /companies.json
  def create
    @company = Company.new(company_params)
    eve_id = Event.where("for_company = true").pluck(:id)

    respond_to do |format|
      if @company.save 
        input_session(@company.id)
        i = 0
        @company.companyevents.where(company_id: @company.id).each do |ce|
          ce.update(event_id: eve_id[i])
          i = i + 1
        end

        # UserMailer.com_reg(@company).deliver_now

        format.html { redirect_to @company, notice: 'Company was successfully created.' }
        format.json { render :show, status: :created, location: @company }
      else
        @eves = Event.where("for_company = true").pluck(:id, :name, :event_date, :start_time, :end_time)
        @it = 0
        @new_flag = 0
        @reps = @company.companyevents.collect(&:representatives)
        format.html { render "companies/new" }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /companies/1
  # PATCH/PUT /companies/1.json
  def update
    respond_to do |format|
      if @company.update(company_params)
        eve_id = Event.where("for_company = true").pluck(:id)
        it = 0
        @company.companyevents.where(company_id: @company.id).each do |ce|
          ce.update(event_id: eve_id[it])
          it = it + 1
        end
        # UserMailer.com_reg(@company).deliver_now
        
        format.html { redirect_to @company, notice: 'Company was successfully updated.' }
        format.json { render :show, status: :ok, location: @company }
      else
        @eves = Event.where("for_company = true").pluck(:id, :name, :event_date, :start_time, :end_time)
        @it = 0
        @new_flag = 0
        @reps = @company.companyevents.collect(&:representatives)

        format.html { render :edit }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    @company.companyevents.destroy_all
    @company.destroy
    respond_to do |format|
      # UserMailer.com_del(@company).deliver_now
      format.html { redirect_to companies_url, notice: 'Company was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.

    def get_id
      params[:id]
    end
    
    def set_company
      @company = Company.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_params
      params.require(:company).permit(:name, :contact_person, :contact_email, :sponsor_level, :citizenship, :job_type, :rep_1, :rep_2, :rep_3, :rep_4, :rep_5, :rep_6, companyevents_attributes: [:id, :representatives, event_attributes: [:id]], :student_level => [])
    end
end
