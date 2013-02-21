require 'spec_helper'

describe "towns/new" do
  before(:each) do
    assign(:town, stub_model(Town,
      :name => "MyString",
      :office => false
    ).as_new_record)
  end

  it "renders new town form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => towns_path, :method => "post" do
      assert_select "input#town_name", :name => "town[name]"
      assert_select "input#town_office", :name => "town[office]"
    end
  end
end
