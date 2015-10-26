class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]

#<><><><>!!!!!!!!!!!! Comment this out for rspec !!!!!!!!!!!!!!!  
  before_filter :authorize, only: [:destroy, :index], :except => :new_session_path
  # GET /companies
  # GET /companies.json
  def index
    @companies = Company.all.order(:name)
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
    unless log_in? || cus_indentify(get_id)
      flash[:danger] = "Please Log in!"
      redirect_to new_session_path
    end
  end

  # GET /companies/new
  def new
    @company = Company.new
    @company.companyevents.build
  end

  # GET /companies/1/edit
  def edit
    @company.companyevents.destroy_all
    @company.companyevents.build
    unless log_in? || cus_indentify(get_id)
      flash[:danger] = "Please Log in!"
      redirect_to new_session_path
    end
  end

  # POST /companies
  # POST /companies.json
  def create
    @company = Company.new(company_params)
    eve_id = Event.pluck(:id)

    respond_to do |format|
      if @company.save
        input_session(@company.id)
        it = 0
        @company.companyevents.where(company_id: @company.id).each do |ce|
          ce.update(event_id: eve_id[it])
          it = it + 1
        end

        UserMailer.com_reg(@company).deliver_now

        format.html { redirect_to @company, notice: 'Company was successfully created.' }
        format.json { render :show, status: :created, location: @company }
      else
        @company.companyevents.destroy_all
        @company.companyevents.build
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
        eve_id = Event.pluck(:id)
        it = 0
        @company.companyevents.where(company_id: @company.id).each do |ce|
          ce.update(event_id: eve_id[it])
          it = it + 1
        end
        UserMailer.com_reg(@company).deliver_now
        
        format.html { redirect_to @company, notice: 'Company was successfully updated.' }
        format.json { render :show, status: :ok, location: @company }
      else
        @company.companyevents.destroy_all
        @company.companyevents.build
        format.html { render :edit }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    @company.destroy
    respond_to do |format|
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
      params.require(:company).permit(:name, :contact_person, :contact_email, :sponsor_level, :citizenship, :job_type, :student_level, :rep_1, :rep_2, :rep_3, :rep_4, :rep_5, :rep_6, companyevents_attributes: [:id, :representatives, event_attributes: [:id]])
    end
end
