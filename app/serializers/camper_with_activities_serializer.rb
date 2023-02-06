class CamperWithActivitiesSerializer < ActiveModel::Serializer
  attributes :id, :name, :age 

  #all the associated activities?
  has_many :activities
end
