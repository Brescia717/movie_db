require 'Gemfile'


def db_connection
  begin
    @db_info = []
    @db_info = PG.connect(dbname: 'movies')

    yield(@db_info)
  ensure
    @db_info.close
  end
end
