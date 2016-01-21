class SomeModel < ActiveRecord::Base
  belongs_to :tree
  belongs_to :tree, class_name: Plant
  has_many :apples
  has_many :watermelons

  validates :name, presence: true, uniqueness: true
end

class PostsController < ActionController::Base
  def index
    posts = Post.all
    render locals: { posts: posts }
  end
end
