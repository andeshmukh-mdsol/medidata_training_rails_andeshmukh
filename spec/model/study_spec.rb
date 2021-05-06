require 'rails_helper'
#study should have a name

describe Study, type: :model do
    context 'when study do not have a name' do
        it 'is invalid' do
            study = Study.new(name: '')
            expect(study.valid?).to eq false
        end
    end

    context 'when study have a name' do
        it 'is valid' do
            study = Study.new(name: 'my_study')
            expect(study.valid?).to eq true
        end
    end

    context 'when drug do not have a name' do
        it 'is valid' do
            study = Study.new(drug: 'my_drug')
            expect(study.valid?).to eq false
        end
    end

    context 'when drug have a name' do
        it 'is valid' do
            study = Study.new(drug: 'my_drug')
            expect(study.valid?).to eq true
        end
    end

    context 'when age limit less than or equal to 7' do
        it 'is valid' do
            study = Study.new(age:7)
            expect(study.valid?).to eq false
        end
    end

    context 'when age limit greater than 7' do
        it 'is valid' do
            study = Study.new(age:8)
            expect(study.valid?).to eq true
        end
    end

    context 'when phase greater than 5' do
        it 'is valid' do
            study = Study.new(phase:6)
            expect(study.valid?).to eq false
        end
    end

    context 'when phase less than 6' do
        it 'is valid' do
            study = Study.new(phase:5)
            expect(study.valid?).to eq true
        end
    end
end