# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Advertisement::Application.initialize!

Time::DATE_FORMATS[:for_manage] = "%d %b %Y"