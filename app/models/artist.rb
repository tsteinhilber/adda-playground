class Artist < ApplicationRecord

  has_many :jobs
  has_and_belongs_to_many :teams

  before_validation :generate_slug

  validates_presence_of :name_first, :on => :create, :message => "can't be blank"
  validates_presence_of :name_last, :on => :create, :message => "can't be blank"
  validates :slug, uniqueness: true, presence: true

  def generate_slug
    self.slug ||= name_full.parameterize
  end

  def name_full
    "#{name_first} #{name_last}"
  end

  def self.search(search)
    if search && search != ""
      where(["lower(slug) LIKE ?", "%#{search.downcase}%"]).or(where(["lower(category) LIKE ?", "%#{search.downcase}%"])).order(:name_last, :name_first)
    end
  end

  def to_param
    slug
  end

  def email=(value)
    super(value.try(:squish))
  end

  def name_first=(value)
    super(value.try(:squish))
  end

  def name_last=(value)
    super(value.try(:squish))
  end

  def website=(value)
    super(value.try(:squish))
  end

end
