require 'sqlite3'
conn = SQLite3::Database.new('test.db')
conn.execute <<-SQL
create table my_table (
  id integer primary key,
  posted integer,
  title varchar(30),
  body varchar(32000)
);
SQL
