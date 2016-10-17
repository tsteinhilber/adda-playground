json.extract! contact, :id, :name_first, :name_last, :title, :email, :old_id, :old_parent_id, :old_address_id, :created_at, :updated_at
json.url contact_url(contact, format: :json)