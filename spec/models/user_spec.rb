require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations' do
    it { should validate_presence_of :iduff }
    it { should validate_presence_of :name }
    it { should validate_presence_of :rating }
  end
end
