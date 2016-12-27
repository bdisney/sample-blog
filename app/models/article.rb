class Article < ApplicationRecord
  has_many :comments
  belongs_to :user, optional: true # опшионал тру добавлено для прохождения теста
  
  validates :title, presence: true
  validates :text, presence: true

  def subject
    title
  end
end
