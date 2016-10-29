class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  before_action :set_categories, only: [:new, :edit]

  # GET /jobs
  # GET /jobs.json
  def index
    @jobs = Job.all
    # @jobs = current_user.jobs
  end

  # GET /jobs/1
  # GET /jobs/1.json
  def show
    authorize @job
  end

  # GET /jobs/new
  def new
    @contact = Contact.includes(:client).find_by_slug(params[:contact])
    @job = Job.new(:estimate_contact_id => @contact)
    # @job = Job.new
  end

  # GET /jobs/1/edit
  def edit
    authorize @job
  end

  # POST /jobs
  # POST /jobs.json
  def create
    @job = Job.new(job_params)

    respond_to do |format|
      if @job.save
        add_teams
        format.html { redirect_to @job, notice: 'Job was successfully created.' }
        format.json { render :show, status: :created, location: @job }
      else
        format.html { render :new }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jobs/1
  # PATCH/PUT /jobs/1.json
  def update
    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to @job, notice: 'Job was successfully updated.' }
        format.json { render :show, status: :ok, location: @job }
      else
        format.html { render :edit }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.json
  def destroy
    @job.destroy
    respond_to do |format|
      format.html { redirect_to jobs_url, notice: 'Job was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def add_teams
    teams = Team.find(params[:teams])
    teams.each do |t|
      @job.teams << t
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
      @job = Job.find(params[:id])
    end

  def set_categories
    @job_categories = ValueList.find_by_name('Job Category').value_items.order(:name)
  end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_params
      params.require(:job).permit(:job_number, :name, :job_status, :category, :job_type, :description, :job_client_id, :job_contact_id, :estimate_client_id, :estimate_contact_id, :billing_client_id, :billing_contact_id, :active)
    end
end
