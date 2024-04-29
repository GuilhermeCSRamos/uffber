require 'rails_helper'

RSpec.describe "passengers/edit", type: :view do
  let(:passenger) {
    Passenger.create!()
  }

  before(:each) do
    assign(:passenger, passenger)
  end

  it "renders the edit passenger form" do
    render

    assert_select "form[action=?][method=?]", passenger_path(passenger), "post" do
    end
  end
end
