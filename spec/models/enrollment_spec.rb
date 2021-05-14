require 'rails_helper'

RSpec.describe Enrollment, type: :model do
  describe '#create' do
    context 'when subject and study are valid' do
      let!(:enrollment) {create(:enrollment)}
      it 'creates a delayed job' do
        expect(Delayed::Job.count).to eq(2)
      end
    end

    context 'when wither subject or study is invalid' do
      let(:subject) {create(:subject, email:'')}
      it 'not queues and jobs' do
        expect{create(:enrollment, subject:subject)}.to raise_error
        expect(Delayed::Job.count).to eq(0)
      end
    end
  end
end
