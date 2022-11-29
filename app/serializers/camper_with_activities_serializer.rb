class CamperWithActivitiesSerializer < ActiveModel::Serializer
  attributes :id, :name, :age, :activities

  # thing.id, thing.activities
end
