require 'rails_helper'

RSpec.describe Comment, type: :model do
  context 'validations' do
    it { should validate_presence_of :body }
  end

  context 'scopes' do
    let(:comment) { FactoryBot.create(:comment) }

    it 'by_lift' do
      expect(Comment.by_lift(comment.lift.id).first).to be_eql(comment)
    end

    it 'by_user' do
      expect(Comment.by_lift(comment.user.id).first).to be_eql(comment)
    end
  end
end
