require 'sqlite3'
require 'singleton'

class PlayDBConnection < SQLite3::Database
  include Singleton

  def initialize
    super('plays.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class Play
  attr_accessor :title, :year, :playwright_id

  def self.all
    data = PlayDBConnection.instance.execute("SELECT * FROM plays")
    data.map { |datum| Play.new(datum) }
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @year = options['year']
    @playwright_id = options['playwright_id']
  end

  def create
    raise "#{self} already in database" if @id
    PlayDBConnection.instance.execute(<<-SQL, @title, @year, @playwright_id)
      INSERT INTO
        plays (title, year, playwright_id)
      VALUES
        (?, ?, ?)
    SQL
    @id = PlayDBConnection.instance.last_insert_row_id
  end

  def update
    raise "#{self} not in database" unless @id
    PlayDBConnection.instance.execute(<<-SQL, @title, @year, @playwright_id, @id)
      UPDATE
        plays
      SET
        title = ?, year = ?, playwright_id = ?
      WHERE
        id = ?
    SQL
  end

  def self.find_by_title(title)
    PlayDBConnection.instance.execute(<<-SQL, title)
      SELECT *
      FROM plays
      WHERE title = ?;
    SQL
  end

  def self.find_by_playwright(name)
    PlayDBConnection.instance.execute(<<-SQL, name)
      SELECT *
      FROM plays
      JOIN playwrights
      ON plays.playwright_id = playwrights.id
      WHERE playwrights.name = ?;
    SQL
  end
end

# Playwright::all
# Playwright::find_by_name(name)
# Playwright#new (this is the initialize method)
# Playwright#create
# Playwright#update
# Playwright#get_plays (returns all plays written by playwright)

class Playwright
  def self.all
    playwrights = PlayDBConnection.instance.execute(<<-SQL)
      SELECT *
      FROM playwrights
    SQL
    playwrights.each { |playwright| Playwright.new(playwright) }
  end

  def initialize(options)
    @name = options[name]
    @birth_year = options[birth_year]
  end
end