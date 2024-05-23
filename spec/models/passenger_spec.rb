require 'rails_helper'

RSpec.describe Passenger, type: :model do
  context 'scopes' do
    let(:passenger) { FactoryBot.create(:passenger) }

    it 'with_lift' do
      # binding.pry
      # expect(Passenger.with_lift(passenger.lift.id).first).to be_eql(passenger)
    end
  end
end