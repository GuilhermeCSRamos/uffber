require 'rails_helper'

RSpec.describe "lifts/show", type: :view do
  before(:each) do
    assign(:lift, Lift.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
