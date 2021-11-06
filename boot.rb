require 'rubygems'
require 'bundler/setup'

Dir['./lib/*.rb'].each { |file| require file }
