class Company < ApplicationRecord

  has_many :legals
  has_many :teams

end
