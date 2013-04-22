namespace :build do

 desc 'Reset dev environment (** deprecated **)'
  task :scratch => :environment do
    abort("Don't run in production silly!") if Rails.env.production?
    ["db:drop", "db:create", "db:migrate", "db:seed"].each do |task|
      puts "-> #{task}"
      Rake::Task[task].execute
    end

    puts "-> Creating shortestpath schema"
    Apartment.database_names.each do |tenant|
      Apartment::Database.create(tenant)
    end

    puts "-> Migrating Apartments"
    Rake::Task["apartment:migrate"].execute

  end # :scratch

end
