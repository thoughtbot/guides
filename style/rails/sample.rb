class SomeClass
  belongs_to :tree
  has_many :apples
  has_many :pumpkins,
    class_name: "Gourd",
    foreign_key: :gourd_id
  has_many :watermelons

  validates :name, presence: true
  validates :title,
    uniqueness: { scope: :tree_id, case_sensitive: false },
    allow_nil: true
end
