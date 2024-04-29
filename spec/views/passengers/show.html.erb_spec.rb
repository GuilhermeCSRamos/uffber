require 'rails_helper'

RSpec.describe "passengers/show", type: :view do
  before(:each) do
    assign(:passenger, Passenger.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
