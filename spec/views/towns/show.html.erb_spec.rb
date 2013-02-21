require 'spec_helper'

describe "towns/show" do
  before(:each) do
    @town = assign(:town, stub_model(Town,
      :name => "Name",
      :office => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/false/)
  end
end
