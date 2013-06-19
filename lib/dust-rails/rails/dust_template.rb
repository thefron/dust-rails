require 'tilt'
require 'execjs'

module Dust
  module Rails

    module Source
      def self.path
        @path ||= File.expand_path('../../../../vendor/dustjs/lib/dust.js', __FILE__)
        puts ">>>>>>>> #{@path}"
        @path
      end

      def self.contents
        @contents ||= File.read(path)
        puts ">>>>>>>> contents: #{@contents}"
        @contents
      end

      def self.context
        @context ||= ExecJS.compile(contents)
        puts ">>>>>>>> ctx: #{@context}"
        @context
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
        puts ">>>>>>>> tmpl_root: #{template_root}"
        puts ">>>>>>>> tmpl_name: #{template_name}"
        Source.context.call("dust.compile", data, template_name)
      end
    end
  end
end