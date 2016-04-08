# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)
require 'csv'

Rails.application.load_tasks



namespace :hello do

  desc "Import CSV Data from COLI Census city data"
  task :jesse => :environment do
  #  Player.delete_all
    csv_file_path = 'baseball.csv'

    CSV.foreach(csv_file_path) do |row|
      Player.create!({
          :name => row[0],
          :average => row[1],
        })
        puts "Row added!"
      end
  end
end
