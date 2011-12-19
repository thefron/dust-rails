require 'rails/engine'

module Dust
  module Rails
    class Engine < ::Rails::Engine
      initializer :register_dustjs do |app|
        app.assets.register_engine '.dust', DustTemplate
      end
    end
  end
end
