require 'rails_helper'

RSpec.describe "lifts/new", type: :view do
  before(:each) do
    assign(:lift, Lift.new())
  end

  it "renders new lift form" do
    render

    assert_select "form[action=?][method=?]", lifts_path, "post" do
    end
  end
end
