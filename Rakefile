require 'rake'
require 'rspec/core/rake_task'

require_relative 'config/application'

desc "create the database"
task "db:create" do
  puts "Creating file #{DB_PATH} if it doesn't exist..."
  touch DB_PATH
end

desc "drop the database"
task "db:drop" do
  puts "Deleting #{DB_PATH}..."
  rm_f DB_PATH
end

desc "migrate the database (options: VERSION=x, VERBOSE=false, SCOPE=blog)."
task "db:migrate" do
  ActiveRecord::Migrator.migrations_paths << File.dirname(__FILE__) + 'db/migrate'
  ActiveRecord::Migration.verbose = ENV["VERBOSE"] ? ENV["VERBOSE"] == "true" : true
  ActiveRecord::Migrator.migrate(ActiveRecord::Migrator.migrations_paths, ENV["VERSION"] ? ENV["VERSION"].to_i : nil) do |migration|
    ENV["SCOPE"].blank? || (ENV["SCOPE"] == migration.scope)
  end
end

desc "populate the test database with sample data"
task "db:seed" do
  require APP_ROOT.join('db', 'seeds.rb')
end

desc "generate a new migration"
task "db:generate:migration", :name do |t, args|
  timestamp = Time.now.strftime('%Y%m%d%H%M%S')
  name = args[:name]
  # touch "#{timestamp}_#{name}.rb"a
  unless File.exists?("#{timestamp}_#{name}.rb")
    File.open("db/migrate/#{timestamp}_create_#{name}.rb", 'w') do |f|
      f.write("require_relative '../config'

class Create#{name.capitalize} < ActiveRecord::Migration
  def change
    create_table #{name.to_sym} do |t|

      t.timestamps

    end
  end
end")
    end
  end
end

desc 'Retrieves the current schema version number'
task "db:version" do
  puts "Current version: #{ActiveRecord::Migrator.current_version}"
end

desc 'Start IRB with application environment loaded'
task "console" do
  exec "irb -r./config/application"
end

desc "Run the specs"
RSpec::Core::RakeTask.new(:spec)

task :default  => :specs
