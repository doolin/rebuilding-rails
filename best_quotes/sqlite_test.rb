require 'sqlite3'
require 'rulers/sqlite_model'

class MyTable < Rulers::Model::SQLite3; end
STDERR.puts MyTable.schema.inspect
