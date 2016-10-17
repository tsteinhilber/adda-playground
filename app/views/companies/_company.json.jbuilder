json.extract! company, :id, :account_number, :name, :name_legal, :old_id, :tax_id, :website, :active, :created_at, :updated_at
json.url company_url(company, format: :json)