class Client < ApplicationRecord

  has_many :contacts
  has_many :jobs, inverse_of: :job_client
  has_many :estimate_jobs, class_name: 'Job', inverse_of: :estimate_client
  has_many :billing_jobs, class_name: 'Job', inverse_of: :billing_client

  before_validation :generate_slug

  validates_presence_of :name, :on => :create, :message => "can't be blank"
  validates :slug, uniqueness: true, presence: true

  def generate_slug
    self.slug ||= name.parameterize
  end

  def self.search(search)
    if search && search != ""
      where(["slug LIKE ?", "%#{search.downcase}%"]).order(:name)
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
