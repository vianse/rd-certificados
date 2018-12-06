require 'roo'
require 'rubygems'
class Usuario < ApplicationRecord
    def self.import(file)
        spreadsheet = open_spreadsheet(file)
        header = spreadsheet.row(1)
          (2..spreadsheet.last_row).map do |i|
            row = Hash[[header, spreadsheet.row(i)].transpose]
            usuario = Usuario.find_by_id(row["id"]) || Usuario.new
            usuario.attributes = row.to_hash
            usuario.save!
          end


      end
      
      def self.open_spreadsheet(file)
        case File.extname(file.original_filename)
        when ".csv" then Roo::CSV.new(file.path, nil, :ignore)
        when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
        when ".xlsx" then Roo::Excelx.new(file.path)
        else raise "Unknown file type: #{file.original_filename}"
        end
      end
end
