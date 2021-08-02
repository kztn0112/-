class Question < ApplicationRecord
  attachment :image
  belongs_to :user
  has_many :answers, dependent: :destroy
end
