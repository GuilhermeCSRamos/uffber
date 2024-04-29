require 'rails_helper'

RSpec.describe "lifts/edit", type: :view do
  let(:lift) {
    Lift.create!()
  }

  before(:each) do
    assign(:lift, lift)
  end

  it "renders the edit lift form" do
    render

    assert_select "form[action=?][method=?]", lift_path(lift), "post" do
    end
  end
end
