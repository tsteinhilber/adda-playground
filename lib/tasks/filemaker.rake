namespace :filemaker do
  task contacts: :environment do
    counter = 0
    Contact.all.each do |contact|
      id_parent =  contact.old_parent_id
      parent = Client.find_by old_id: id_parent
      if parent
        contact.client_id = parent.id
        contact.save
      end
      counter += 1 if contact.persisted?
      p parent.id
      p "======================"
      p contact
    end
    puts "Related #{counter} contacts"
  end
end