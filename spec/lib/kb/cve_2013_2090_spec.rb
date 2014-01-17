require 'spec_helper'
describe "The CVE-2013-2090 vulnerability" do
	before(:all) do
		@check = Codesake::Dawn::Kb::CVE_2013_2090.new
		# @check.debug = true
	end
  it "fires when vulnerable cremefraiche version is used" do
    @check.dependencies = [{:name=>"cremefraiche", :version=>'0.6.1'}]
    @check.vuln?.should   be_true
  end
  it "doesn't fire when not vulnerable cremefraiche version is used" do
    @check.dependencies = [{:name=>"cremefraiche", :version=>'0.6.2'}]
    @check.vuln?.should   be_false
  end
  it "fires when 0.5 and previous versions are found. We must check that cremefraiche version 0.5.2 version is vulnerable"
  # it "doesn't fire when an older not vulnerable cremefraiche version is used" do
  #   @check.dependencies = [{:name=>"cremefraiche", :version=>'0.5.2'}]
  #   @check.vuln?.should   be_false
  # end
end
