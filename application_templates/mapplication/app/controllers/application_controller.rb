class ApplicationController < ActionController::Base
  helper :all
  protect_from_forgery
  before_filter :load_config

  def load_config
    config = YAML::load(File.open("#{RAILS_ROOT}/config/mapplication.yml"))
    @mapplication = SharedProject.find(config['mapplication']['id'])
    @layers = @mapplication.layers
  end
  
end
