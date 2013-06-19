require 'tilt'
require 'execjs'

module Dust
  module Rails

    module Source
      def self.path
        @path ||= File.expand_path('../../../../vendor/dustjs/lib/dust.js', __FILE__)
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
        template_root = Dust.config.template_root
        template_name = file.split(template_root).last.split('.',2).first
        dust_source = "dust.loadSource(dust.compile("+ data +","+ template_name +"));"
        Source.context.call(dust_source)
      end
    end
  end
end