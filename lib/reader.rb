require 'terminal-table'
require_relative 'parser'

class Reader
  def initialize(path)
    @logs = Parser.new.parse_file(path)
    show_output
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

  def create_table(title, rows)
    table = Terminal::Table.new
    table.title = title
    table.headings = %w[page hits]
    table.rows = rows
    table.style = { width: 50 }

    "#{table}\n\n"
  end

  def show_output
    puts create_table('Most Views', most_views)
    puts create_table('Unique Views', unique_views)
  end
end
