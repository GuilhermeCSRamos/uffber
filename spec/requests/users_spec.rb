require 'rails_helper'

RSpec.describe "/users", type: :request do

  let(:valid_attributes) {
    {
      name: "teste", iduff: "iduff", driver: false
    }
  }

  let(:invalid_attributes) {
    {}
  }

  let(:user_driver) { FactoryBot.create(:user) }
  let!(:driver) { FactoryBot.create(:driver, user: user_driver) }

  describe "GET /history" do
    let(:user) { FactoryBot.create(:user) }
    let(:passenger) { FactoryBot.create(:passenger, user: user) }

    let!(:lift_passenger1) { FactoryBot.create(:lift_passenger, passenger: passenger, lift: active_lift) }
    let!(:lift_passenger2) { FactoryBot.create(:lift_passenger, passenger: passenger, lift: ended_lift) }
    let!(:lift_passenger3) { FactoryBot.create(:lift_passenger, passenger: passenger, lift: pending_lift) }
    let!(:lift_passenger4) { FactoryBot.create(:lift_passenger, passenger: passenger, lift: cancelled_lift) }

    let(:active_lift) { FactoryBot.create(:lift, status: :active, driver: driver) }
    let(:ended_lift) { FactoryBot.create(:lift, status: :ended, driver: driver) }
    let(:pending_lift) { FactoryBot.create(:lift, status: :pending, driver: driver) }
    let(:cancelled_lift) { FactoryBot.create(:lift, status: :cancelled, driver: driver) }

    context "as driver" do
      it "renders a successful response" do
        get user_history_url(user_driver), as: :json

        expect(response).to be_successful
        expect(JSON.parse response.body).to include(JSON.parse ended_lift.attributes.to_json)
        expect(JSON.parse response.body).to include(JSON.parse cancelled_lift.attributes.to_json)
      end
    end

    context "as passenger" do
      it "renders a successful response" do
        get user_history_url(user), as: :json

        expect(response).to be_successful
        expect(JSON.parse response.body).to include(JSON.parse ended_lift.attributes.to_json)
        expect(JSON.parse response.body).to include(JSON.parse cancelled_lift.attributes.to_json)
      end
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      get user_url(user_driver)

      expect(response).to be_successful
      expect(JSON.parse response.body).to include(JSON.parse({ user: user_driver, driver: driver }.to_json))
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new User" do
        expect {
          post users_url, params: { user: valid_attributes }
        }.to change(User, :count).by(1)
      end

      it "redirects to the created user" do
        post users_url, params: { user: valid_attributes }
        expect(response).to have_http_status(:bad_request)
      end
    end

    context "with invalid parameters" do
      it "does not create a new User" do
        expect {
          post users_url, params: { user: invalid_attributes }
        }.to change(User, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post users_url, params: { user: invalid_attributes }
        expect(response).to have_http_status(:bad_request)
      end

    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        {
          name: "novo nome", cnh: "nova cnh", driver: true
        }
      }

      it "updates the requested user" do
        patch user_url(user_driver), params: { user: new_attributes }, as: :json
        user_driver.reload

        expect(user_driver.name).to eq(new_attributes[:name])
        expect(user_driver.driver.cnh).to eq(new_attributes[:cnh])
      end

      it "redirects to the user" do
        patch user_url(user_driver), params: { user: new_attributes }, as: :json
        user_driver.reload
        driver.reload

        expect(JSON.parse response.body).to include(JSON.parse({ user: user_driver, driver: driver }.to_json))
      end
    end

    context "with invalid parameters" do
      it "renders a response with bad request" do
        patch user_url(user_driver), params: { user: invalid_attributes }
        expect(response).to have_http_status(:bad_request)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested user" do
      expect {
        delete user_url(user_driver)
      }.to change(User, :count).by(-1)
    end

    it "redirects to the users list" do
      delete user_url(user_driver)

      expect(response).to have_http_status :ok
    end
  end
end
