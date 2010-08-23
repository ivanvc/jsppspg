require 'rubygems'
require 'yaml'
require 'lunetas'

class TeamNames
  include Lunetas::Candy
  matches '^/index.html'

  def before
    @@yaml    ||= YAML::load(File.read 'team-names.yml')
    @@teams   ||= {}
    @nouns      = @@yaml['names']['nouns']
    @adjectives = @@yaml['names']['adjectives']
    @players    = @@yaml['names']['players']
  end

  def get
    team, players = create_name
    html = ['<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> <html xmlns="http://www.w3.org/1999/xhtml"> <head> <meta http-equiv="Content-type" content="text/html; charset=utf-8"><center>']
    html << ["<h1>#{team}</h1><h2>#{players.join('</h2><h2>')}</h2>"] if team
    html << @@teams.map { |team, players| "<p>#{team}: #{players.join(', ')}</p>" }
    html << '<input type="button" value="Next Team" onClick="window.location.reload()">'
    html << "</center>"
    html
  end

  def create_name
    return if @players.empty?
    team_name = "#{@nouns.delete(@nouns.choice)} #{@adjectives.delete @adjectives.choice}"
    @@teams[team_name] = []
    2.times { @@teams[team_name] << @players.delete(@players.choice) }
    [team_name, @@teams[team_name]]
  end

end

