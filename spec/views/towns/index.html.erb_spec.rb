require 'spec_helper'

describe "towns/index" do
  before(:each) do
    assign(:towns, [
      stub_model(Town,
        :name => "Name",
        :office => false
      ),
      stub_model(Town,
        :name => "Name",
        :office => false
      )
    ])
  end

  it "renders a list of towns" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => '', :count => 2
  end
end
