require_relative '../spec_helper'
require_relative '../../lib/reader'

RSpec.describe Reader do
  let(:log) { 'spec/test_data/webserver_test_data.log' }
  let(:reader) { Reader.new(log) }

  context 'when calling most_views' do
    it 'returns hash keys ordered by value count' do
      expect(reader.most_views).to eq({ '/help_page/1' => 4,
                                        '/home' => 2,
                                        '/about' => 1,
                                        '/index' => 1,
                                        '/about/2' => 1,
                                        '/contact' => 1 })
    end
  end

  context 'when calling unique_views' do
    it 'returns hash keys ordered by unique values' do
      expect(reader.unique_views).to eq({ '/help_page/1' => 4,
                                          '/contact' => 1,
                                          '/home' => 2,
                                          '/about/2' => 1,
                                          '/index' => 1,
                                          '/about' => 1 })
    end
  end

  context 'when creating a terminal table' do
    it 'creates and displays correctly' do
      title = 'Testing'
      rows = reader.most_views
      table = reader.create_table(title, rows)

      # sorry for this line below...
      expect(table).to eq("+------------------------+-----------------------+\n|                    Testing                     |\n+------------------------+-----------------------+\n| page                   | hits                  |\n+------------------------+-----------------------+\n| /help_page/1           | 4                     |\n| /home                  | 2                     |\n| /about                 | 1                     |\n| /index                 | 1                     |\n| /about/2               | 1                     |\n| /contact               | 1                     |\n+------------------------+-----------------------+\n\n")
    end
  end
end
