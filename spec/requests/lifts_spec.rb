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

RSpec.describe "/lifts", type: :request do

  # This should return the minimal set of attributes required to create a valid
  # Lift. As you add validations to Lift, be sure to
  # adjust the attributes here as well.
  # let(:valid_attributes) {
  #   {
  #     "driver_id":1,
  #     "status":0,
  #     "start_location":"minha casa",
  #     "end_location":"casa da ruiva"
  #   }
  # }

  # let(:invalid_attributes) {
  #   {}
  # }

  # describe "GET /index" do
  #   let(:passenger) { FactoryBot.create(:passenger) }
  #   let(:lift_passenger) { FactoryBot.create(:lift_passenger, passenger: passenger, lift: lift) }
  #   let(:driver) { FactoryBot.create(:driver) }
  #   let!(:lift) { FactoryBot.create(:lift, :without_driver) }
  #   let!(:lift_with_driver) { FactoryBot.create(:lift, :with_driver, driver: driver) }
  #
  #   context "when driver" do
  #     it "renders a successful response" do
  #       get lifts_url, params: { lift: { driver: true } }, as: :json
  #
  #       expect(JSON.parse response.body).to_not include(JSON.parse lift_with_driver.to_json)
  #       expect(JSON.parse response.body).to include(JSON.parse lift.to_json)
  #     end
  #   end
  #
  #   context "when passenger" do
  #     it "renders a successful response" do
  #       get lifts_url, params: { lift: { driver: false } }, as: :json
  #
  #       expect(JSON.parse response.body).to_not include(JSON.parse lift.to_json)
  #       expect(JSON.parse response.body).to include(JSON.parse lift_with_driver.to_json)
  #     end
  #   end
  # end

  describe "GET /driver_index" do
    let(:passenger) { FactoryBot.create(:passenger) }
    let(:lift_passenger) { FactoryBot.create(:lift_passenger, passenger: passenger, lift: lift) }
    let(:driver) { FactoryBot.create(:driver) }
    let!(:lift) { FactoryBot.create(:lift, :without_driver) }
    let!(:lift_with_driver) { FactoryBot.create(:lift, :with_driver, driver: driver) }

    context "when driver" do
      it "renders a successful response" do
        get driver_index_lifts_url

        expect(JSON.parse response.body).to_not include(JSON.parse lift_with_driver.to_json)
        expect(JSON.parse response.body).to include(JSON.parse lift.to_json)
      end
    end
  end

  describe "GET /passenger_index" do
    let(:passenger) { FactoryBot.create(:passenger) }
    let(:lift_passenger) { FactoryBot.create(:lift_passenger, passenger: passenger, lift: lift) }
    let(:driver) { FactoryBot.create(:driver) }
    let!(:lift) { FactoryBot.create(:lift, :without_driver) }
    let!(:lift_with_driver) { FactoryBot.create(:lift, :with_driver, driver: driver) }

    context "when passenger" do
      it "renders a successful response" do
        get passenger_index_lifts_url

        expect(JSON.parse response.body).to_not include(JSON.parse lift.to_json)
        expect(JSON.parse response.body).to include(JSON.parse lift_with_driver.to_json)
      end
    end
  end

  describe "GET /show" do
    let(:driver) { FactoryBot.create(:driver) }
    let!(:lift) { FactoryBot.create(:lift, driver: driver) }

    it "renders a successful response" do
      get lift_url(lift)
      expect(response).to be_successful
    end
  end

  context "when driver" do
    let(:driver) { FactoryBot.create(:driver) }
    describe "POST /create" do
      context "with valid parameters" do
        let(:valid_attributes) {
          {
            "driver_id": driver.id,
            "status": :active,
            "start_location": "minha casa",
            "end_location": "casa da ruiva"
          }
        }

        it "creates a new Lift" do
          expect {
            post lifts_url, params: { lift: valid_attributes }
          }.to change(Lift, :count).by(1)
        end

        it "redirects to the created lift" do
          post lifts_url, params: { lift: valid_attributes }

          expect(response).to have_http_status(201)
        end
      end

      context "with invalid parameters" do
        let(:invalid_attributes) {
          {}
        }

        it "does not create a new Lift" do
          expect {
            post lifts_url, params: { lift: invalid_attributes }
          }.to change(Lift, :count).by(0)
        end


        it "renders a response with 400 status (i.e. to display the 'new' template)" do
          post lifts_url, params: { lift: invalid_attributes }
          expect(response).to have_http_status(:bad_request)
        end
      end
    end

    describe "PATCH /update" do
      let(:passenger) { FactoryBot.create(:passenger) }
      let!(:lift_passenger) { FactoryBot.create(:lift_passenger, passenger: passenger, lift: lift) }
      let(:lift) { FactoryBot.create(:lift) }

      context "with valid parameters" do
        # let(:valid_attributes) {
        #   {
        #     "status": :active
        #   }
        # }

        let(:new_attributes) {
          {
            "driver_id": driver.id,
            "start_location": "minha casa",
            "end_location": "casa da ruiva"
          }
        }

        it "updates the requested lift" do
          patch lift_url(lift), params: { lift: new_attributes }
          lift.reload

          expect(lift).to have_attributes(new_attributes)
        end

        it "have http status ok" do
          patch lift_url(lift), params: { lift: new_attributes }
          lift.reload

          expect(response).to have_http_status(:ok)
        end
      end

      context "with invalid parameters" do
        let(:invalid_attributes) {
          {}
        }

        it "renders a response with 400 status (i.e. to display the 'edit' template)" do
          patch lift_url(lift), params: { lift: invalid_attributes }
          expect(response).to have_http_status(:bad_request)
        end
      end
    end
  end

  context "when passenger" do
    let(:passenger) { FactoryBot.create(:passenger) }
    # let!(:lift_passenger) { FactoryBot.create(:lift_passenger, passenger: passenger, lift: lift) }
    # let(:lift) { FactoryBot.create(:lift) }
    describe "POST /create" do
      context "with valid parameters" do
        let(:valid_attributes) {
          {
            "passenger_id": passenger.id,
            "status": :pending,
            "pickup_location": "minha casa",
            "dropoff_location": "casa da ruiva"
          }
        }

        it "creates a new Lift" do
          expect {
            post lifts_url, params: { lift: valid_attributes }
          }.to change(Lift, :count).by(1)
        end

        it "redirects to the created lift" do
          post lifts_url, params: { lift: valid_attributes }
          expect(response).to have_http_status(201)
        end
      end

      context "with invalid parameters" do
        let(:invalid_attributes) {
          {}
        }

        it "does not create a new Lift" do
          expect {
            post lifts_url, params: { lift: invalid_attributes }
          }.to change(Lift, :count).by(0)
        end


        it "renders a response with 400 status (i.e. to display the 'new' template)" do
          post lifts_url, params: { lift: invalid_attributes }
          expect(response).to have_http_status(:bad_request)
        end
      end
    end

    describe "PATCH /update" do
      let(:driver) { FactoryBot.create(:driver) }
      let!(:lift) { FactoryBot.create(:lift, driver: driver) }

      context "with valid parameters" do
        let(:new_attributes) {
          {
            "passenger_id": passenger.id,
            "status": :active,
            "pickup_location": "minha casa",
            "dropoff_location": "casa da ruiva"
          }
        }

        it "updates the requested lift" do
          patch lift_url(lift), params: { lift: new_attributes }
          lift.reload

          expect(lift.passenger).to include(passenger)
        end

        it "have http status ok" do
          patch lift_url(lift), params: { lift: new_attributes }
          lift.reload
          expect(response).to have_http_status(:ok)
        end
      end

      context "with invalid parameters" do
        let(:invalid_attributes) {
          {}
        }

        it "renders a response with 400 status (i.e. to display the 'edit' template)" do
          patch lift_url(lift), params: { lift: invalid_attributes }
          expect(response).to have_http_status(:bad_request)
        end

      end
    end
  end

  # describe "DELETE /destroy" do
  #   let!(:lift) { FactoryBot.create(:lift) }
  #
  #   it "destroys the requested lift" do
  #     expect {
  #       delete lift_url(lift)
  #     }.to change(Lift, :count).by(-1)
  #   end
  #
  #   it "have http status oks list" do
  #     delete lift_url(lift)
  #     expect(response).to have_http_status(:ok)
  #   end
  # end
end
