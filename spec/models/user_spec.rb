require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    context 'created' do
      let(:user) { FactoryGirl.create(:user, role: :normal) }
      it 'valid' do
        expect(user.valid?).to be true
      end
      it 'normal?' do
        expect(user.normal?).to be true
      end
    end
  end
end
