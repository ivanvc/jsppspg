require 'dm-core'
require 'dm-timestamps'
require 'dm-validations'
require 'sinatra'

configure do
  set :app_file, File.expand_path(File.dirname(__FILE__) + '/app.rb')
  set :public,   File.expand_path(File.dirname(__FILE__) + '/public')
  set :views,    File.expand_path(File.dirname(__FILE__) + '/views')
  disable :run, :reload
end

DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/apuestas.sql")

get '/' do
  @teams = Team.all.map { |team| { :team => team, :bets => team.bets } } 
  @total_bets = Bet.all.size
  @total_bets = 1 if @total_bets.zero?
  erb :index
end

post '/' do
  bet = Bet.new(params[:bet])
  bet.save
  redirect '/' 
end

class Bet 
  include DataMapper::Resource
  property :id, Serial
  property :owner, String, :required => true
  property :amount, Integer, :required => true
  belongs_to :team
end

class Team
  include DataMapper::Resource
  property :id, Serial
  property :name, String, :required => true
  has n, :bets
end

DataMapper.auto_upgrade!

