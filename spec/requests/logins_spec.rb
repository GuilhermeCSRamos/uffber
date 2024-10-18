require 'rails_helper'

RSpec.describe "/logins", type: :request do

  let(:driver_attributes) {
    {
      iduff: user.iduff, password: "password", driver: true
    }
  }

  let(:passenger_attributes) {
    {
      iduff: user.iduff, password: "password", driver: false
    }
  }

  let!(:driver) { FactoryBot.create(:driver, user: user) }
  let!(:passenger) { FactoryBot.create(:passenger, user: user) }
  let(:user) { FactoryBot.create(:user, password: "password") }

  describe "POST /create" do
    context "with valid parameters" do
      it "return driver info" do
        post logins_url, params: { login: driver_attributes }, as: :json

        expect(JSON.parse response.body).to eq({ "user_id"=>user.id, "driver_id"=>driver.id, "passenger_id"=>nil })
      end

      it "return passenger info" do
        post logins_url, params: { login: passenger_attributes }, as: :json

        expect(JSON.parse response.body).to eq({ "user_id"=>user.id, "driver_id"=>nil, "passenger_id"=>passenger.id })
      end
    end

    context "with invalid parameters" do
      context "and driver" do
        let!(:driver) { FactoryBot.create(:driver, user: user2) }
        let(:user2) { FactoryBot.create(:user) }
        let(:invalid_driver_attributes) {
          {
            iduff: user2.iduff, password: "password", driver: false
          }
        }

        it "return driver info" do
          post logins_url, params: { login: invalid_driver_attributes }, as: :json

          expect(JSON.parse response.body).to eq("error" => "failed to login")
        end
      end

      context "and passenger" do
        let!(:passenger) { FactoryBot.create(:passenger, user: user2) }
        let(:user2) { FactoryBot.create(:user) }
        let(:invalid_passenger_attributes) {
          {
            iduff: user2.iduff, password: "password", driver: true
          }
        }

        it "return driver info" do
          post logins_url, params: { login: invalid_passenger_attributes }, as: :json

          expect(JSON.parse response.body).to eq("error" => "failed to login")
        end
      end
    end
  end
end
