require 'rake'
require 'rspec/core/rake_task'

require ::File.expand_path('../config/application', __FILE__)

# Include all of ActiveSupport's core class extensions, e.g., String#camelize
#require 'active_support/core_ext'

namespace :db do
  desc "Create the database at #{DB_NAME}"
  task :create do
    puts "Creating database #{DB_NAME} if it doesn't exist..."
    exec("createdb #{DB_NAME}")
  end

  desc "Drop the database at #{DB_NAME}"
  task :drop do
    puts "Dropping database #{DB_NAME}..."
    exec("dropdb #{DB_NAME}")
  end

  desc "Migrate the database (options: VERSION=x, VERBOSE=false, SCOPE=blog)."
  task :migrate do
    ActiveRecord::Migrator.migrations_paths << File.dirname(__FILE__) + 'db/migrate'
    ActiveRecord::Migration.verbose = ENV["VERBOSE"] ? ENV["VERBOSE"] == "true" : true
    ActiveRecord::Migrator.migrate(ActiveRecord::Migrator.migrations_paths, ENV["VERSION"] ? ENV["VERSION"].to_i : nil) do |migration|
      ENV["SCOPE"].blank? || (ENV["SCOPE"] == migration.scope)
    end
  end

  desc "Populate the database with dummy data by running db/seeds.rb"
  task :seed do
    require APP_ROOT.join('db', 'seeds.rb')
  end

  desc "Returns the current schema version number"
  task :version do
    puts "Current version: #{ActiveRecord::Migrator.current_version}"
  end
end

task :default  => :specs
