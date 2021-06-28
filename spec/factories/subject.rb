FactoryBot.define do
    factory :subject do
        name {'subject test 1'}
        age {rand(10..100)}
        email {"andeshmukh+#{rand(1..10)}@mdsol.com}"}
    end
end