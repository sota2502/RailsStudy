require 'rails_helper'

RSpec.describe Mythread, type: :model do
  describe '#title' do
    context 'empty' do
      it 'invalid' do
        mythread = Mythread.new(title: '')
        mythread.valid?
        expect(mythread.errors[:title]).to be_present
      end
    end
  end

  describe '#body' do
    context 'empty' do
      it 'invalid' do
        mythread = Mythread.new(body: '')
        mythread.valid?
        expect(mythread.errors[:body]).to be_present
      end
    end
  end

  describe '#create' do
    context 'created' do
      let(:mythread) { FactoryGirl.create(:mythread) }
      it 'valid' do
        expect(mythread.valid?).to be true
      end
    end
  end
end
