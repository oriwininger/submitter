class JobApplicationsController < ApplicationController

# http_basic_authenticate_with name: "fiverr", password: "G0FiveRR", only: :index


  def delete
    @application = JobApplication.find(params[:id])
    @application.destroy

    respond_to do |format|
      format.html { redirect_to job_applications_path }
      format.json { head :no_content }
    end
  end

  def hide
    @application = JobApplication.find(params[:id])
    @application.status = 'hide'
    @application.save!
    redirect_to root_path
  end

  def approve
    @application = JobApplication.find(params[:id])
    @application.status = 'approved'
    @application.save!
    redirect_to root_path
  end
  # GET /applications
  # GET /applications.json
  def index
    Graylog.notify!('my message')
    @applications = JobApplication.all
    @jobs = Job.all
    #respond_to do |format|
      #format.html # index.html.erb
      #format.json { render json: @applications }
    #end
  end

  # GET /applications/1
  # GET /applications/1.json
  def show
    @application = JobApplication.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @application }
    end
  end


  # GET /applications/new
  # GET /applications/new.json
  def new
    @job = Job.find_by_parameter(params["jobapp"])
   if @job.nil?
      redirect_to 'http://www.fiverr.com/jobs'
   else
    @action = :new
    @application = JobApplication.new
    @company = User.find_by_company(params[:company_id])
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @application }
      end
    end
  end

  # GET /applications/1/edit
  def edit
    @application = JobApplication.find(params[:id])
  end

  # POST /applications
  # POST /applications.json
  def create
    job_application = JobApplication.new(params[:JobApplication])
    @job = Job.find_by_parameter(params[:jobapp])
    job_application.job = @job.name
    job_application.location = @job.job_location
    job_application.status = :pending
    # application.status = :pending
    job_application.save!
        #binding.pry
    redirect_to 'http://www.fiverr.com'
  #  else
   #   @application = JobApplication.new(params[:job_application])
   #   render action: "new"
    end
  end

  # PUT /applications/1
  # PUT /applications/1.json
  def update
    @application = JobApplication.find(params[:id])

    respond_to do |format|
      if @application.update_attributes(params[:application])
        format.html { redirect_to @application, notice: 'Application was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @application.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /applications/1
  # DELETE /applications/1.json
  def destroy
    @application = JobApplication.find(params[:id])
    @application.destroy

    respond_to do |format|
      format.html { redirect_to job_applications_path }
      format.json { head :no_content }
    end
end
