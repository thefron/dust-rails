require "dust-rails/version"
require "dust-rails/rails/engine.rb"
require "dust-rails/rails/dust_template.rb"
require "dust-rails/rails/railtie.rb"

module Dust
  class Config
    attr_accessor :template_root
  end

  def self.config
    @@config ||= Config.new
  end

  def self.configure
    yield self.config
  end
end
