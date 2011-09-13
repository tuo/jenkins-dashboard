require 'rubygems'
Dir[File.dirname(__FILE__) + '/jenkins/dashboard/*.rb'].each {|file| require file }
