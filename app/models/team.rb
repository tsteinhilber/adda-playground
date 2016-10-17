class Team < ApplicationRecord

  has_many :memberships
  has_many :users, through: :memberships
  has_and_belongs_to_many :artists
  has_and_belongs_to_many :jobs
  belongs_to :company

  def category_types
    category_types = ["Hair & Makeup", "Photography", "Accounting"]
  end

end
