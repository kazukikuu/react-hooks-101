ActiveRecord::Base.establish_connection("sqlite3:db/development.db")
Bundler.require

if development?
  ActiveRecord::Base.establish_connection('sqlite3:db/development.db')
end

class History < ActiveRecord::Base
end