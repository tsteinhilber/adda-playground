class DashboardController < ApplicationController

  before_action :authenticate_user!

  helper_method :find_contacts

  def index
    @profile = "staff"
  end

  def artist_search
    @term = params[:search_artist]
    @artists = Artist.search(params[:search_artist])
    respond_to do |format|
      format.js
    end
  end

  def contact_search
    @term = params[:search_contact]
    @contacts = Contact.search(params[:search_contact])
    respond_to do |format|
      format.js
    end
  end

  def job_search
    @term = params[:search_job]
    @jobs = Job.search(params[:search_job])
    respond_to do |format|
      format.js
    end
  end
end
