# Include an href or to_param attribute when serializing models
class PostSerializer < ActiveModel::Serializer
  attributes :id, :content, :to_param

  delegate :to_param, to: :object
end

FactoryGirl.define do
  factory :event do
    start_on { 1.week.from_now }
  end
end
