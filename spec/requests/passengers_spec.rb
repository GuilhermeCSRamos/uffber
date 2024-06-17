require 'rails_helper'

RSpec.describe "/passengers", type: :request do

  describe "GET /actual_lift" do
    let(:passenger) { FactoryBot.create(:passenger) }
    let!(:lift_passenger) { FactoryBot.create(:lift_passenger, passenger: passenger, lift: lift) }
    let(:lift) { FactoryBot.create(:lift, status: :active) }

    it "renders a successful response" do
      get passenger_actual_lift_url(passenger), as: :json

      expect(response).to be_successful
      expect(JSON.parse response.body).to eq(JSON.parse lift.to_json)
    end
  end
end
