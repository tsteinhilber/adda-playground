class Contact < ApplicationRecord

  belongs_to :client
  has_many :jobs, inverse_of: :job_contact
  has_many :estimate_jobs, class_name: 'Job', inverse_of: :estimate_contact
  has_many :billing_jobs, class_name: 'Job', inverse_of: :billing_contact

  before_validation :generate_slug

  validates_presence_of :name_first, :on => :create, :message => "can't be blank"
  validates :slug, uniqueness: true, presence: true

  def generate_slug
    self.slug ||= name_full.parameterize
  end

  def name_full
    "#{name_first} #{name_last}"
  end

  def self.search(search)
    if search && search != ""
      # psearch = search.parameterize
      where(["lower(name_first) LIKE ?", "%#{search.downcase}%"]).or(where(["lower(name_last) LIKE ?", "%#{search.downcase}%"])).or(where(["lower(email) LIKE ?", "%#{search.downcase}%"])).order(:name_last, :name_first)
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

  def title=(value)
    super(value.try(:squish))
  end

end
