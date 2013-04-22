desc 'kills connections to postgres db'
task :kill_postgres_connections => :environment do

  db_name = "#{File.basename(Rails.root)}_#{Rails.env}"

  puts "WARN: killing connections to #{db_name}"
  sh = <<EOF
ps xa \
  | grep postgres: \
  | grep #{db_name} \
  | grep -v grep \
  | awk '{print $1}' \
  | xargs kill
EOF
  puts `#{sh}`
end

task "db:drop" => :kill_postgres_connections
