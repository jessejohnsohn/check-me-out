require 'csv'

namespace :hello do

  desc "Import CSV Data from COLI Census city data"
  task :jesse => :environment do
    Player.delete_all
    csv_file_path = 'db/baseball.csv'

    CSV.foreach(csv_file_path) do |row|
      if row.length > 4  #wanted to ignore some straggling data and blank spaces in the file
        Player.create!({
          :name => row[0],
          :average => row[1],
        })
        puts "Row added!"
      end
    end
  end
end
