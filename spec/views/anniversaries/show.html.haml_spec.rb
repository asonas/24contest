require 'spec_helper'

describe "anniversaries/show" do
  before(:each) do
    @anniversary = assign(:anniversary, stub_model(Anniversary))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
