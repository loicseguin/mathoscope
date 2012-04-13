describe "ApplicationHelper" do
  describe "full_title" do
    it { full_title("foo").should =~ /^The Mathoscope/ }
    it { full_title("").should_not =~ /\|/ }
  end
end
