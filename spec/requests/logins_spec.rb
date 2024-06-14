require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/logins", type: :request do

  # This should return the minimal set of attributes required to create a valid
  # login. As you add validations to login, be sure to
  # adjust the attributes here as well.
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
  let(:user) { FactoryBot.create(:user) }

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
  end
end
