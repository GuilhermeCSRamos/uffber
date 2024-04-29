require 'rails_helper'

RSpec.describe "passengers/new", type: :view do
  before(:each) do
    assign(:passenger, Passenger.new())
  end

  it "renders new passenger form" do
    render

    assert_select "form[action=?][method=?]", passengers_path, "post" do
    end
  end
end
