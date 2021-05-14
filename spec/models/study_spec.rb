require 'rails_helper'
#study should have a name

describe Study, type: :model do
    context 'when study do not have a name' do
        it 'is invalid' do
            # study = create(:study)
            # binding.pry
            study = build(:study, name: '')
            expect(study.valid?).to eq false
        end
    end

    context 'when study have a name' do
        it 'is valid' do
            study = build(:study, name: 'my_study')
            expect(study.valid?).to eq true
        end
    end

    context 'when drug do not have a name' do
        it 'is valid' do
            study = build(:study, drug: '')
            expect(study.valid?).to eq false
        end
    end

    context 'when drug have a name' do
        it 'is valid' do
            study = build(:study, drug: 'my_drug')
            expect(study.valid?).to eq true
        end
    end

    context 'when age limit less than or equal to 7' do
        it 'is valid' do
            study = build(:study, age_limit:7)
            expect(study.valid?).to eq false
        end
    end

    context 'when age limit greater than 7' do
        it 'is valid' do
            study = build(:study, age_limit:8)
            expect(study.valid?).to eq true
        end
    end

    context 'when phase greater than 5' do
        it 'is valid' do
            study = build(:study, phase:6)
            expect(study.valid?).to eq false
        end
    end

    context 'when phase less than 6' do
        it 'is valid' do
            study = build(:study, phase:5)
            expect(study.valid?).to eq true
        end
    end

    describe '#scopes' do
    before do # run it once
        create_list(:study, 10, phase:4)
        create_list(:study, 20, phase:2)
    end
        context 'when we call usable_drugs' do
            it 'returns drugs with phase 4 or greater' do
                expect(Study.usable_drugs.count).to eq(10)
            end
        end

        context 'when we call under_trials' do
            it 'returns drugs under phase 4' do
                expect(Study.under_trials.count).to eq(20)
            end
        end
    end
end