class UserSerializer < ActiveModel::Serializer
  attributes :username, :password_digest, :email, :bio, :img_url
end
