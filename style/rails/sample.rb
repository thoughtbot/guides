class SomeClass
  belongs_to :tree, class_name: Plant
  has_many :apples
  has_many :watermelons

  validates :name, presence: true, uniqueness: true
end
