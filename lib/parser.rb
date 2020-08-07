class Parser
  def parse_file(path)
    file_validation(path)
    file = File.open(path).map(&:strip)
    create_log_hash(file)
  end

  private

  def file_validation(path)
    file_extension = path.split('.').last

    raise 'Incorrect file format' unless file_extension == 'log'
    raise 'File not found' unless File.exist?(path)
  end

  def create_log_hash(file)
    hash = Hash.new { |h, k| h[k] = [] }
    file.each do |entry|
      page, ip = entry.split
      hash[page] << ip
    end
    hash
  end
end
