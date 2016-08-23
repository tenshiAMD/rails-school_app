module TestData
  def fixture_file_loc(filename)
    File.join(File.dirname(__FILE__), 'fixtures', filename)
  end

  def fixture_file(filename)
    File.open(fixture_file_loc(filename))
  end

  def fixture_uploaded_file(filename, mime_type = nil, binary = false)
    Rack::Test::UploadedFile.new(fixture_file_loc(filename), mime_type, binary)
  end
end

RSpec.configure do |config|
  config.include TestData
end
