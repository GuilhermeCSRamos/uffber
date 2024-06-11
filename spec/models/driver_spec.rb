require 'rails_helper'

RSpec.describe Driver, type: :model do
  let(:driver) { FactoryBot.create(:driver) }
  let!(:lift) { FactoryBot.create(:lift, driver: driver) }

  context 'validations' do
    it { should validate_presence_of :cnh }
  end

  context 'scopes' do
    let(:no_lifts_driver) { FactoryBot.create(:driver) }
    let!(:ended_lift) { FactoryBot.create(:lift, driver: no_lifts_driver, status: :ended) }

    it 'with_lifts' do
      expect(Driver.with_lifts).to eq([driver])
    end
  end

  context 'methods' do
    it 'active_lift' do
      expect(driver.active_lifts).to eq([lift])
    end
  end
end
