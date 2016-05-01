$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'mitier'
require 'pry'
require 'dotenv'

Dotenv.load

EXTRACTOR = Mitier::Extractor.new(ENV['TEST_MODEL_PATH']).load
