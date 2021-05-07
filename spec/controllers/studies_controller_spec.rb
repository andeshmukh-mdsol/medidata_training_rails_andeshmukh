require 'rails_helper'
require 'spec_helper'
require 'pry'
RSpec.describe StudiesController do 
    describe '#create' do 
        context 'when study created successfully' do
            before do
                @sg1 = StudyGroup.create(name:'study group 4')
            end

            let(:study_parameters) do
                {
                    name: 'abcd',
                    age_limit: 30,
                    drug: 'pfizer',
                    phase: 0,
                    study_group_id: @sg1.id
                }
            end
            
            it 'returns success message' do
                post :create, params: {study:study_parameters}
                binding.pry
                expect(response)
            end
        end

        context 'when study did not create' do

            let(:study_parameters) do
                {
                    name: 'abcd',
                    age_limit: 30,
                    drug: 'pfizer',
                    phase: 0,
                    study_group_id: @sg1.id
                }
            end
            
            it 'returns success message' do
                post :create, params: {study:study_parameters}
                binding.pry
                expect(response)
            end
        end
    end
end