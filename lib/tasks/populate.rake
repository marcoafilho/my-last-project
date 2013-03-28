namespace :db do
  desc "Erase and fill the database"
  
  task populate: :environment do
    [User, Resource, Author, Note, Quotation, Notification, Project].each(&:delete_all)
    
    2000.times do
      User.create(
        name: Faker::Name.name,
        type: User::AVAILABLE_ROLES.shuffle.first,
        email: Faker::Internet.email,
        password: "12345678"
      )
    end
    
    Professor.all.each do |professor|
      rand(4).times do
        professor.projects.create(
          title: Faker::Lorem.sentence
        )
      end
    end
    
    Student.all.each do |student|
      student.update_attribute(:project_id, rand(Project.count) + 1)
    end
    
    User.all.each do |user|
      rand(5).times do
        resource = user.resources.new(
          title: Faker::Company.catch_phrase,
          type: Resource::AVAILABLE_RESOURCES.shuffle.first
        )
        resource.authors = (rand(4) + 1).times.collect { Author.new(name: Faker::Name.name) }
        resource.save
      end
    end
  end
end