require 'spec_helper'

describe "towns/edit" do
  before(:each) do
    @town = assign(:town, stub_model(Town,
      :name => "MyString",
      :office => false
    ))
  end

  it "renders the edit town form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => towns_path(@town), :method => "post" do
      assert_select "input#town_name", :name => "town[name]"
      assert_select "input#town_office", :name => "town[office]"
    end
  end
end
