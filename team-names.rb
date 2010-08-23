require 'rubygems'
require 'yaml'

def create_names(quantity, nouns = [], adjectives = [])
  names = []
  quantity.times do
    names << "#{nouns.delete(nouns.choice)} #{adjectives.choice}"
  end
  names
end

source = YAML::load(File.read ARGV[0])
puts source.inspect
available_nouns = source["names"]["nouns"]
available_adjvs = source["names"]["adjectives"]

puts create_names(ARGV[1].to_i, available_nouns, available_adjvs)

