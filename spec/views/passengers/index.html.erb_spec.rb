require 'rails_helper'

RSpec.describe "passengers/index", type: :view do
  before(:each) do
    assign(:passengers, [
      Passenger.create!(),
      Passenger.create!()
    ])
  end

  it "renders a list of passengers" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
  end
end
