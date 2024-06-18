require 'rails_helper'

RSpec.describe Vehicle, type: :model do
  context 'validations' do
    it { should validate_presence_of :model }
    it { should validate_presence_of :color }
    it { should validate_presence_of :license_plate }
    it { should validate_presence_of :capacity }
    it { should validate_presence_of :kind }
  end
end
