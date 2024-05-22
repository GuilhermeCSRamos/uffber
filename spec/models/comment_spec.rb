require 'rails_helper'

RSpec.describe Comment, type: :model do
  context 'validations' do
    it { should validate_presence_of :body }
  end

  context 'scopes' do
    let(:comment) { create(:comment) }

    it {
      binding.pry
    }
  end
end
