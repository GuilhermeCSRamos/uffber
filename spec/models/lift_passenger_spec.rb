require 'rails_helper'

RSpec.describe LiftPassenger, type: :model do
  context 'validations' do
    it { should validate_presence_of :pickup_location }
    it { should validate_presence_of :dropoff_location }
  end
end
