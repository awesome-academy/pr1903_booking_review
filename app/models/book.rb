class Book < ApplicationRecord
  belongs_to :category
  has_many :reviews
  has_many :likes

  validates :category_id, presence: true
  validates :title, presence: true
  validates :author, presence: true, length: {maximum: 100}
  validates :conten, presence:true
  has_one_attached :picture


end
