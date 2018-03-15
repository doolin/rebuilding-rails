require 'sqlite3'
require 'rulers/util'

DB = SQLite3::Database.new('test.db')

module Rulers
  module Model
    class SQLite3
      def self.table
        Rulers.to_underscore(name)
      end
    end
  end
end
