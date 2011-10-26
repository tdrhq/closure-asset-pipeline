module ClosureProcessor
  class Railtie < Rails::Engine
    config.closure = ActiveSupport::OrderedOptions.new
    config.closure.compress = false

    initializer :setup_closure do |app|
        app.assets.append_path File.expand_path("../..", ClosureDependenciesProcessor.closure_library)
        app.assets.register_engine '.soy', SoyTemplateProcessor

      if config.closure.compress         
        app.assets.register_preprocessor 'application/javascript', ClosureDependenciesProcessor
      end
    end

  end
end
