class RecordingSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :path, :name
  belongs_to :user
end
