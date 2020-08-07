require 'terminal-table'
require_relative 'parser'

class Reader
  def initialize(path)
    @logs = Parser.new.parse_file(path)
  end

  def most_views
    hash = {}

    @logs.each do |k, v|
      hash[k] = v.count
    end

    hash.sort_by(&:last).reverse.to_h
  end

  def unique_views
    hash = Hash.new(0)
    @logs.each { |k, v| hash[k] = v.uniq.count }

    hash
  end

  def create_table

  end
end
