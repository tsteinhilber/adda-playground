class Job < ApplicationRecord

  belongs_to :job_client, class_name: "Client", foreign_key: "job_client_id"
  belongs_to :job_contact, class_name: "Contact", foreign_key: "job_contact_id"

  belongs_to :estimate_client, class_name: "Client", foreign_key: "estimate_client_id"
  belongs_to :estimate_contact, class_name: "Contact", foreign_key: "estimate_contact_id"

  belongs_to :billing_client, class_name: "Client", foreign_key: "billing_client_id"
  belongs_to :billing_contact, class_name: "Contact", foreign_key: 'billing_contact_id'

  has_and_belongs_to_many :teams

  validates_presence_of :job_number, :on => :create, :message => "can't be blank"


  def self.search(search)
    if search && search != ""
      where(["lower(job_number) LIKE ?", "%#{search.downcase}%"]).order(job_number: :desc)
    end
  end

end
