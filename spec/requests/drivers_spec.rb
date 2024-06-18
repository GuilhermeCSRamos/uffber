require 'rails_helper'

RSpec.describe "/drivers", type: :request do

  let!(:driver) { FactoryBot.create(:driver, user: user) }
  let(:user) { FactoryBot.create(:user) }

  describe "GET /actual_lift" do
    let!(:lift) { FactoryBot.create(:lift, status: :active, driver: driver) }

    it "renders a successful response" do
      get driver_actual_lift_url(driver), as: :json

      expect(response).to be_successful
      expect(JSON.parse response.body).to eq(JSON.parse lift.to_json)
    end
  end
end
