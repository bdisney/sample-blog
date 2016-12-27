class Comment < ApplicationRecord
  belongs_to :article
  belongs_to :user, optional: true # опшионал тру добавлено для прохождения теста
end
