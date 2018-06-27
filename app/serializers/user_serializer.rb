class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :name, :password_digest, :email

  has_many :recordings
end
