class JobPolicy
  attr_reader :user, :job

  def initialize(user, job)
    @user = user
    @job = job
  end

  def show?
    ids = Job.joins(:teams).where('jobs_teams.team_id' => user.teams).pluck(:id)
    user.admin? or ids.include? job.id
  end

  def edit?
    ids = Job.joins(:teams).where('jobs_teams.team_id' => user.teams).pluck(:id)
    user.admin? or ids.include? job.id
  end

  def update?
    ids = Job.joins(:teams).where('jobs_teams.team_id' => user.teams).pluck(:id)
    user.admin? or ids.include? job.id
  end
end