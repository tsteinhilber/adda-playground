class Vendor < ApplicationRecord

  before_validation :generate_slug

  validates_presence_of :name, :on => :create, :message => "can't be blank"
  validates :slug, uniqueness: true, presence: true

  def generate_slug
    self.slug ||= name.parameterize
  end

  def self.search(search)
    if search && search != ""
      psearch = search.parameterize
      where(["lower(slug) LIKE ?", "%#{psearch.downcase}%"]).or(where(["lower(category) LIKE ?", "%#{search.downcase}%"])).order(:name)
    end
  end

  def to_param
    slug
  end

  def category=(value)
    super(value.try(:squish))
  end

  def name=(value)
    super(value.try(:squish))
  end

  def website=(value)
    super(value.try(:squish))
  end

end
