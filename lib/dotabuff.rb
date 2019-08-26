require "dotabuff/version"
require 'mechanize'


module Dotabuff
  HOME = File.expand_path(File.join(File.dirname(__FILE__), '..', '..')).freeze
  MAIN_URL = 'https://www.dotabuff.com/'.freeze
  HEROES_URL = URI.join(MAIN_URL, '/heroes')
  PICK_URL = URI.join(MAIN_URL, '/counters')
  # Your code goes here...
end

require 'dotabuff/utility'
require 'dotabuff/parsers/base'
require 'dotabuff/parsers/heroes'
require 'dotabuff/client'
