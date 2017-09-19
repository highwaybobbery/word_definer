require 'pg'
class DbConnection

  attr_reader :db
  DB_NAME = 'word_definer'

  @@connections = {}

  def initialize
    db_env = ENV['RACK_ENV'] || 'development'
    db_name = "#{DB_NAME}_#{db_env}"
    puts "initializing new db connection to: #{db_name}"
    @db = PG.connect(dbname: db_name)
  end

  def self.connection
    @@connections[ENV['RACK_ENV']] ||= self.new
  end

  def select(sql)
    result = exec(sql)
    self.class.symbolize(result)
  end

  def exec(sql)
    db.exec sql
  end

  def reset_db
    drop_tables
    create_tables
  end

  def drop_tables
    exec 'drop table if exists words;'
    exec 'drop table if exists definitions;'
  end

  def clear_tables
    exec 'delete from words *;'
    exec 'delete from definitions *;'
  end

  def create_tables
    exec 'create table if not exists words (id serial primary key, term varchar);'
    exec 'create table if not exists definitions (id serial primary key, word_id int, text varchar);'
  end

  private

  def self.symbolize(result)
    result.map do |row|
      row.each_with_object({}) { |(k,v), h| h[k.to_sym] = v }
    end
  end
end
