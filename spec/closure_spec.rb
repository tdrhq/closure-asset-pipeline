require "./lib/closure-asset-pipeline/directive_processor"

describe 'closure-prepreprocessor' do
  it "should have a valid closure compiler" do
    File.exists?(ClosureDependenciesProcessor.closure_bin).should be_true()
  end

  it "should have a valid closure library directory" do
    File.directory?(ClosureDependenciesProcessor.closure_library).should be_true()
  end
end

