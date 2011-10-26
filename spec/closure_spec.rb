require "./lib/closure-asset-pipeline/directive_processor"
require "tempfile"

describe 'closure-prepreprocessor' do
  it "should have a valid closure compiler" do
    File.exists?(ClosureDependenciesProcessor.closure_bin).should be_true()
  end

  it "should have a valid closure library directory" do
    File.directory?(ClosureDependenciesProcessor.closure_library).should be_true()
  end

  it "should do a basic compilation" do
    f1 = Tempfile.new("some")
    f1.puts <<EOF
alert("this is a test");
EOF
    f1.flush

    ClosureDependenciesProcessor.new(f1.path).render.should match(/this is a test/)
  end
end

