class Answer < ApplicationRecord
  belongs_to :user
  belongs_to :question
  has_many :likes, dependent: :destroy
  has_many :notifications, dependent: :destroy

  validates :content, presence: true

  def liked_by?(user)                     #既にいいね済かを判定
    likes.where(user_id: user.id).exists?
  end

end
