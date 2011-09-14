require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Jenkins::Dashboard::YmlReader do
  
  let(:fixture_path) { File.expand_path(File.dirname(__FILE__) + "/fixtures") }
  
  it "should load ci address successfully for well-formatted yml" do
    result = Jenkins::Dashboard::YmlReader.parse(fixture_path + "/well_format.yml")
    result.should == [{
      :ci_address => "http://ci.jruby.org/view/Ruboto/",
      :jobs_name  => ["job_h1", "job-h2"]
    }]
  end

  it "should load ci address successfully for well-formatted_without jobs_names yml" do
    result = Jenkins::Dashboard::YmlReader.parse(fixture_path + "/well_format_without_jobs_name.yml")
    result.should == [{
      :ci_address => "http://ci.jruby.org/view/Ruboto/"
    }]
  end


  it "should parse right when no prefix colon" do
    result = Jenkins::Dashboard::YmlReader.parse(fixture_path + "/format_tolerable.yml")
    result.should == [{
      :ci_address => "http://ci.jruby.org/view/Ruboto/",
      "jobs_name" => ["job1", "job2"]
    }]
  end
    
  it "should throw exception for not well-formatted yml" do
    expect {
        Jenkins::Dashboard::YmlReader.parse(fixture_path + "/bad_format.yml")
      }.to raise_exception(
  "Error parsing yml.Check out your yml format.")    
  end

  it "should throw exception when can't find yml" do
     expect {
         Jenkins::Dashboard::YmlReader.parse(fixture_path + "/non_existing.yml")
       }.to raise_exception(
   "File not found. check out file path: #{fixture_path}/non_existing.yml")    
   end


end