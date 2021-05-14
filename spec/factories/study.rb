FactoryBot.define do
    factory :study do
        name {'study_1'}
        age_limit {rand(10..100)}
        drug {'new_drug'}
        phase {1}
        symptoms {['fever','cough']}
        # study_group_id {2} #create a new factory instead of writing like this 
        association :study_group
    end
end