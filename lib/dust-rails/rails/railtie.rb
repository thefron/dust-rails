require 'rails'

module Dust
  module Rails
    class Railtie < ::Rails::Railtie
      config.dust = ActiveSupport::OrderedOptions.new

      initializer "dust.configure" do |app|
        Dust.configure do |config|
          config.template_root = app.config.dust[:template_root] || 'app/assets/javascripts/templates/'
        end
      end
    end
  end
end
