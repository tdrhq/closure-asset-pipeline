# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "closure-asset-pipeline/version"

Gem::Specification.new do |s|
  s.name        = "closure-asset-pipeline"
  s.version     = Closure::AssetPipeline::VERSION
  s.authors     = ["Arnold Noronha", "Ilya Grigorik"]
  s.email       = ["arnstein87@gmail.com", "ilya@igvita.com"]
  s.homepage    = "https://github.com/tdrhq/closure-asset-pipline"
  s.summary     = "Sprockets processor for Google's Closure tools"
  s.description = s.summary

  s.rubyforge_project = "closure-sprockets"
  s.add_dependency "tilt"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
