require 'csv'

namespace :import do
  desc "Import Contacts from CSV"
  task contacts: :environment do
    filename = "/Users/toddsteinhilber/Desktop/contacts.csv"
    counter = 0
    CSV.foreach(filename) do |row|
      old_id, old_parent_id, old_address_id, name_first, name_last, title, email, created_at, updated_at = row
      contact = Contact.create(old_id: old_id, old_parent_id: old_parent_id, old_address_id: old_address_id, name_first: name_first, name_last: name_last, title: title, email: email, created_at: created_at, updated_at: updated_at)
      puts "#{name_first} #{name_last} - #{contact.errors.full_messages.join(',')}" if contact.errors.any?
      counter += 1 if contact.persisted?
    end
    puts "Imported #{counter} contacts"
  end

  desc "Import Companies from CSV"
  task companies: :environment do
    filename = "/Users/toddsteinhilber/Desktop/companies.csv"
    counter = 0
    CSV.foreach(filename) do |row|
      account_number, name, name_legal, old_id, tax_id, website, created_at, updated_at = row
      company = Company.create(account_number: account_number, name: name, name_legal: name_legal, old_id: old_id, tax_id: tax_id, website: website, created_at: created_at, updated_at: updated_at)
      puts "#{name} - #{company.errors.full_messages.join(',')}" if company.errors.any?
      counter += 1 if company.persisted?
    end
    puts "Imported #{counter} companies"
  end

  desc "Import Vendors from CSV"
  task vendors: :environment do
    filename = "/Users/toddsteinhilber/Desktop/vendors.csv"
    counter = 0
    CSV.foreach(filename) do |row|
      old_id, category, name, website, created_at, updated_at = row
      vendor = Vendor.create(old_id: old_id, category: category, name: name, website: website, created_at: created_at, updated_at: updated_at)
      puts "#{name} - #{vendor.errors.full_messages.join(',')}" if vendor.errors.any?
      counter += 1 if vendor.persisted?
    end
    puts "Imported #{counter} vendors"
  end
end