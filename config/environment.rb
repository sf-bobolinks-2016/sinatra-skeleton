# Set up gems listed in the Gemfile.
# See: http://gembundler.com/bundler_setup.html
#      http://stackoverflow.com/questions/7243486/why-do-you-need-require-bundler-setup
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)
require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])

# Require gems we care about
require 'rubygems'
require 'pry'
require 'uri'
require 'pathname'
require 'twitter'
require 'pg'
require 'active_record'
require 'logger'

require 'sinatra'
require "sinatra/reloader" if development?
require "sinatra/json"

# CORS
require 'sinatra/cross_origin'
require 'bcrypt'
require 'erb'
require 'haml'
require 'dotenv'
Dotenv.load
# Some helper constants for path-centric logic
APP_ROOT = Pathname.new(File.expand_path('../../', __FILE__))

APP_NAME = APP_ROOT.basename.to_s

configure do

  # ------------------------------------------------
  # If you want to share this with the DBC network.
  # ------------------------------------------------
  # Get your ip by running this in the console:

  # $ ifconfig en0 inet

  # You'll see this prompt:

  # en0: flags=8863<UP,BROADCAST,SMART,RUNNING,SIMPLEX,MULTICAST> mtu 1500
  # inet 192.168.0.101 netmask 0xffffff00 broadcast 192.168.0.255

  # Use your inet and bind it... (copy, past and uncomment)

  # set :bind, '192.168.0.101'
  # ------------------------------------------------

  # By default, Sinatra assumes that the root is the file that calls the configure block.
  # Since this is not the case for us, we set it manually.
  set :root, APP_ROOT.to_path


  # See: http://www.sinatrarb.com/faq.html#sessions
  # Thurday topic
  enable :sessions
  set :session_secret, ENV['SESSION_SECRET'] || 'this is a secret shhhhh'

  # Set the views to
  set :views, File.join(Sinatra::Application.root, "app", "views")

  enable :cross_origin
end

# Set up the controllers and helpers
Dir[APP_ROOT.join('app', 'controllers', '*.rb')].each { |file| require file }
Dir[APP_ROOT.join('app', 'helpers', '*.rb')].each { |file| require file }

# Set up the database and models
require APP_ROOT.join('config', 'database')


# TEST (??)
# before do
# 	p params
# end
