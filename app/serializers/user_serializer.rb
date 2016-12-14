class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :display_name, :github_login
end
