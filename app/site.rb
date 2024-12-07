require 'sinatra'

class Site < Sinatra::Application

  # app directory settings
  set :root, File.dirname(__FILE__)
  set :views, settings.root + '/view'
  set :public_folder, settings.root + '/public'

  set :haml,
    :format => :html5,
    :layout => :'layouts/basic_page'

  get '/' do
    haml "Hello Dolly!"
  end

  # start the server if executed directly
  run! if app_file == $0
end
