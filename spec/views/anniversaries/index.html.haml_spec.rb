require 'spec_helper'

describe "anniversaries/index" do
  before(:each) do
    assign(:anniversaries, [
      stub_model(Anniversary),
      stub_model(Anniversary)
    ])
  end

  it "renders a list of anniversaries" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
