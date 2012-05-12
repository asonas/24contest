require 'spec_helper'

describe "anniversaries/edit" do
  before(:each) do
    @anniversary = assign(:anniversary, stub_model(Anniversary))
  end

  it "renders the edit anniversary form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => anniversaries_path(@anniversary), :method => "post" do
    end
  end
end
