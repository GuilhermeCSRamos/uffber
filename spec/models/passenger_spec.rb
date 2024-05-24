require 'rails_helper'

RSpec.describe Passenger, type: :model do
  context 'scopes' do
    let(:passenger) { FactoryBot.create(:passenger) }
    let!(:lift_passenger) { FactoryBot.create(:lift_passenger, passenger: passenger, lift: lift) }
    let(:lift) { FactoryBot.create(:lift) }

    it 'with_lift' do
      expect(Passenger.with_lifts.first).to be_eql(passenger)
    end
  end
end