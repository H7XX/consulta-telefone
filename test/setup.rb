require 'minitest/autorun'
require 'vcr'

require_relative '../lib/consulta_telefone'

VCR.configure do |config|
  config.cassette_library_dir = "test/fixtures/cassettes"
  config.hook_into :webmock
end