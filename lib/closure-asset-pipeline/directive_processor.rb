require "tilt"

class ClosureDependenciesProcessor < Tilt::Template
  def prepare; end

  def self.closure_bin
    File.expand_path("../../../vendor/assets/javascripts/closure-library/closure/bin/build/closurebuilder.py", __FILE__)
  end

  def self.closure_library
    File.expand_path("../../../vendor/assets/javascripts/closure-library/", __FILE__)
  end

  def evaluate(context, locals, &block)
    data
  end
end
