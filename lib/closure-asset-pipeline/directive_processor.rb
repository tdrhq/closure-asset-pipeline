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
    root_dir = @options[:root_dir] || "./assets/javascripts" 
    f = Tempfile.new(["result", ".js"])
    cmd = p("#{self.class.closure_bin} --root=#{self.class.closure_library} --root=#{root_dir} -i #{file} --output_mode=compiled --compiler_jar=#{self.class.compiler_jar}")
    `#{cmd}`
  end
end
