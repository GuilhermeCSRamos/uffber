require 'rails_helper'

RSpec.describe Lift, type: :model do
  context 'scopes' do
    let!(:active_lift) { FactoryBot.create(:lift, status: :active) }
    let!(:ended_lift) { FactoryBot.create(:lift, status: :ended) }
    let!(:pending_lift) { FactoryBot.create(:lift, status: :pending) }
    let!(:cancelled_lift) { FactoryBot.create(:lift, status: :cancelled) }

    it 'active' do
      expect(Lift.active).to eq([active_lift])
    end
    it 'ended' do
      expect(Lift.ended).to eq([ended_lift])
    end
    it 'pending' do
      expect(Lift.pending).to eq([pending_lift])
    end
    it 'cancelled' do
      expect(Lift.cancelled).to eq([cancelled_lift])
    end
  end
end
