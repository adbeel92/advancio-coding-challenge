# frozen_string_literal: true

require 'minitest/autorun'
require 'minitest/test'
require 'minitest/spec'
require 'pry'

def file_fixture(name)
  File.open("./test/fixtures/files/#{name}")
end
