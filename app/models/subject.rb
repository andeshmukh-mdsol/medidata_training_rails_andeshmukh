class Subject < ApplicationRecord
    has_one :address, as: :addressable
    has_many :enrollments
    has_many :studies, through: :enrollments
    before_save :dump_subject
    validates_presence_of :email
    
    def dump_subject
        response = Faraday.post('http://localhost:3001/subjects') do |request|
            request.headers = {'Content-Type' => 'application/json'}
            request.body = {subject: self}.to_json
        end
        response.status == 201
        puts '*'*20
        puts response.body
    end
end
