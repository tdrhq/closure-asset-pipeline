require "./lib/closure-asset-pipeline/directive_processor"
require "tempfile"

describe 'closure-prepreprocessor' do
  after do
    @f1.unlink if @f1
    @f2.unlink if @f2
  end

  it "should have a valid closure compiler" do
    File.exists?(ClosureDependenciesProcessor.closure_bin).should be_true()
  end

  it "should have a valid closure library directory" do
    File.directory?(ClosureDependenciesProcessor.closure_library).should be_true()
  end

  it "should have a valid closure compiler" do
    File.exists?(ClosureDependenciesProcessor.compiler_jar).should be_true()
  end

  it "should do a basic compilation" do
    @f1 = f1 = Tempfile.new(["some", ".js"])
    f1.puts <<EOF
goog.provide("t.one");
alert("this is a test");
EOF
    f1.flush

    ClosureDependenciesProcessor.new(f1.path, 1, :root_dir => Dir.tmpdir).render.should match(/this is a test/)
  end

  it "should pull in dependencies" do
    tempdir = Dir.tmpdir
    @f1 = f1 = Tempfile.new(["some1", ".js"], tempdir)
    @f2 = f2 = Tempfile.new(["some2", ".js"], tempdir)

    f1.puts <<EOF
goog.provide("f.one");
goog.require("f.two");
alert("blah");
EOF
    f1.flush

    f2.puts <<EOF
goog.provide("f.two");
alert("this is a test");
EOF
    f2.flush

    ClosureDependenciesProcessor.new(f1.path, 1, :root_dir => tempdir).render.should match(/this is a test/)

  end
end

