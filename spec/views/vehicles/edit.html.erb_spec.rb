require 'rails_helper'

RSpec.describe "vehicles/edit", type: :view do
  let(:vehicle) {
    Vehicle.create!()
  }

  before(:each) do
    assign(:vehicle, vehicle)
  end

  it "renders the edit vehicle form" do
    render

    assert_select "form[action=?][method=?]", vehicle_path(vehicle), "post" do
    end
  end
end
