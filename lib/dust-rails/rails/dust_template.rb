require 'tilt'
require 'execjs'

module Dust
  module Rails

    module Source
      
      def self.precompile(data, template)
        @precompile ||= context.call("dust.compile", data, template)
      end

      private
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
        compiled = Source.precompile(data, template_name)
        <<-TEMPLATE 
          (function(ctx, callback) {
            dust.loadSource(#{compiled.inspect});
          })
        TEMPLATE
      end
    end
  end
end