require "dotabuff/version"
require 'mechanize'
require 'dotabuff/client'

module Dotabuff
  HOME = File.expand_path(File.join(File.dirname(__FILE__), '..', '..')).freeze
  MAIN_URL = 'https://www.dotabuff.com/'.freeze
  HEROES_URL = URI.join(MAIN_URL, '/heroes')
  # Your code goes here...
end
