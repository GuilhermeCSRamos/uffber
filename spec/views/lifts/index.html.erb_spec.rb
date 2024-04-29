require 'rails_helper'

RSpec.describe "lifts/index", type: :view do
  before(:each) do
    assign(:lifts, [
      Lift.create!(),
      Lift.create!()
    ])
  end

  it "renders a list of lifts" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
  end
end
