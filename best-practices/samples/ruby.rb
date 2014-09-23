# Include an href or to_param attribute when serializing models
class PostSerializer < ActiveModel::Serializer
  attributes :id, :content, :to_param

  delegate :to_param, to: :object
end
