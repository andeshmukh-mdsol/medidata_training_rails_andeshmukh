class StudyGroupSerializer < ActiveModel::Serializer
  #what you want to return with your api
  #attributes :id, :name

  #all attributes as original
  # attributes *StudyGroup.column_names

  # attributes :study_group_identifier, :sites # self=>serializer object, object will give you current json
  # def study_group_identifier
  #   object.name
  # end

  # def sites 
  #   object.sites.map {|x| x.name.capitalize}
  # end
end
