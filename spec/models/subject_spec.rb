require 'rails_helper'

RSpec.describe Subject, type: :model do
  describe '#save' do
    context 'when a valid subject is submitted' do
      let(:subject) {build(:subject)}
      before do
        # Subject.any_instance.stub(:dump_subject).and_return({one: 1}) # stubbing method call
        stub_request(:post, 'http://localhost:3001/subjects')
        .with({headers: {'Content-Type' => 'application/json'},
        body:{subject: subject1}.to_json
      }).and_return({status: 201})
      end
      it 'creates a record' do
        # binding.pry
      end
    end

    context 'when an invalid subject is submitted' do
      it 'fails to create a record' do
      end
    end
  end
end


