require 'spec_helper'

describe "anniversaries/new" do
  before(:each) do
    assign(:anniversary, stub_model(Anniversary).as_new_record)
  end

  it "renders new anniversary form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => anniversaries_path, :method => "post" do
    end
  end
end
