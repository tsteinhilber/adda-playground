class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :memberships
  has_many :teams, through: :memberships

  def name_full
    "#{name_first} #{name_last}"
  end

  def artists
    Artist.joins(:teams).where('artists_teams.team_id' => self.teams).order(:name_last, :name_first)
  end

  def jobs
    Job.joins(:teams).where('jobs_teams.team_id' => self.teams).distinct.order(job_number: :desc)
  end

  def admin?
    self.admin
  end

end
