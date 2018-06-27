class RecordingSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :path
  belongs_to :user
end
