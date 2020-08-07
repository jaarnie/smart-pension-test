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
    end
  end
end
