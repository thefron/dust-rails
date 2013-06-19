require 'tilt'
require 'execjs'

module Dust
  module Rails

    module Source
      def self.context
        path = File.expand_path('../../../../vendor/dustjs/lib/dust.js', __FILE__)
        contents = File.read(path)
        ExecJS.compile(contents)
      end

    end

    class DustTemplate < ::Tilt::Template

      def self.default_mime_type
        'application/javascript'
      end

      def prepare
      end

      def evaluate(scope, locals, &block)
        template_root = Dust.config.template_root
        template_name = file.split(template_root).last.split('.',2).first
        Source.context.call("dust.compileFn", data, template_name)
      end
    end
  end
end