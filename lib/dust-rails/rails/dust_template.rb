require 'tilt'
require 'execjs'

module Dust
  module Rails

    module Source
      def self.path
        @path ||= File.expand_path('../../../../vendor/assets/javascripts/dust-full-for-compile.js', __FILE__)
      end

      def self.contents
        @contents ||= File.read(path)
      end

      def self.context
        @context ||= ExecJS.compile(contents)
      end

    end

    class DustTemplate < ::Tilt::Template

      def self.default_mime_type
        'application/javascript'
      end

      def prepare
      end

      def evaluate(scope, locals, &block)
        <<-TMPL
        #{Source.context.call("dust.compile", data, name)}
        TMPL
      end
    end
  end
end


