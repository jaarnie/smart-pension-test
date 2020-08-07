require_relative '../spec_helper'
require_relative '../../lib/parser'

RSpec.describe Parser do
  let(:log) { 'spec/test_data/webserver_test_data.log' }

  describe 'parsing file' do
    parser = Parser.new

    context 'when file is invalid' do
      it "raises error 'Incorrect file format' if file extension is invalid" do
        expect { parser.parse_file('./invalid_log.exe') }.to raise_error(RuntimeError, 'Incorrect file format')
      end

      it "raises 'File not found' if file doesn't exist" do
        expect { parser.parse_file('../test.log') }.to raise_error(RuntimeError, 'File not found')
      end
    end

    context 'when file is valid' do
      let(:data) { parser.parse_file(log) }

      it 'returns the log data as a hash' do
        expect(data).to be_a(Hash)
      end

      it 'returns the correct data' do
        expected_data = { '/help_page/1' =>
                          ['126.318.035.038', '929.398.951.889', '722.247.931.582', '646.865.545.408'],
                          '/contact' => ['184.123.665.067'],
                          '/home' => ['184.123.665.067', '235.313.352.950'],
                          '/about/2' => ['444.701.448.104'],
                          '/index' => ['444.701.448.104'],
                          '/about' => ['061.945.150.735'] }

        expect(data).to eq(expected_data)
      end
    end
  end
end
