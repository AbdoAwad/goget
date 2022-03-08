class JobsController < ApplicationController
  before_action :set_job, only: %i[ show edit update ]
  
  before_action :authenticate_user!, except:[:index, :show]

  # GET /jobs or /jobs.json
  def index
    # @jobs = Job.near([current_user.latitude, current_user.longitude], 50, :order => :distance)
    @jobs = Job.all
  end

  def myjobs
    # @jobs = Job.all
    @myjobs = current_user.jobs
  end


  # GET /jobs/1 or /jobs/1.json
  def claim
    @job = Job.find(params[:id])
  end

  # GET /jobs/new
  def new
    @job = Job.new
  end

  # GET /jobs/1/edit
  def edit
  end


  # POST /jobs or /jobs.json
  def create
    results = Geocoder.search([job_params[:drop_off_street], job_params[:drop_off_city], job_params[:drop_off_postcode], job_params[:drop_off_state]].compact.join(", "))
    if results.first
      @job = current_user.jobs.new(job_params.merge(:status => 1, :drop_off_latitude => results.first.coordinates[0], :drop_off_longitude=> results.first.coordinates[1] ))
    else
      @job = current_user.jobs.new(job_params.merge(:status => 1))
    end
    respond_to do |format|
      if @job.save
        format.html { redirect_to job_url(@job), notice: "Job was successfully created." }
        format.json { render :show, status: :created, location: @job }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end
  

  # PATCH/PUT /jobs/1 or /jobs/1.json
  def update
    respond_to do |format|
      if @job.status == 2
        if @job.update(job_params.merge(:status => 3, :gogeter_id => current_user.id))
          format.html { redirect_to "/jobs", notice: "Job was successfully Completed." }
          format.json { render :job, status: :ok, location: @job }
        else
          format.html { render :claim, status: :unprocessable_entity }
          format.json { render json: @job.errors, status: :unprocessable_entity }
        end
      end 
      if @job.update(job_params.merge(:status => 2, :gogeter_id => current_user.id))
        format.html { redirect_to job_url(@job), notice: "Job was successfully Claimed." }
        format.json { render :claim, status: :ok, location: @job }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def job_params
      params.require(:job).permit(:pickup_street, :pickup_city, :pickup_state, :pickup_postcode, :drop_off_street, :drop_off_city, :drop_off_state, :drop_off_postcode, :pickup_latitude, :pickup_longitude, :drop_off_latitude, :drop_off_longitude, :user_id, :gogeter_id, :status)
    end
end
