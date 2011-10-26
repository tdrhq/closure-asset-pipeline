require "tilt"

class ClosureDependenciesProcessor < Tilt::Template
  def prepare; end

  def self.closure_bin
    File.expand_path("../../../vendor/assets/javascripts/closure-library/closure/bin/build/closurebuilder.py", __FILE__)
  end

  def self.closure_library
    File.expand_path("../../../vendor/assets/javascripts/closure-library/", __FILE__)
  end

  def self.compiler_jar
    File.expand_path("../../../vendor/bin/compiler.jar", __FILE__)
  end

  def evaluate(context, locals, &block)
    f = Tempfile.new(["result", ".js"])
    cmd = p("#{self.class.closure_bin} --root=#{self.class.closure_library} --root=#{p(@options[:root_dir])} -i #{file} --output_mode=compiled --compiler_jar=#{self.class.compiler_jar}")
    `#{cmd}`
  end
end
