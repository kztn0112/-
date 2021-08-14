class Question < ApplicationRecord
  attachment :image
  belongs_to :user
  belongs_to :making_genre
  belongs_to :bread_genre
  has_many :answers, dependent: :destroy
  has_many :notifications, dependent: :destroy

  validates :title, presence: true
  validates :content, presence: true

  def self.search_for(content)
    Question.where('title LIKE ? OR content LIKE ?', '%' + content + '%' , '%' + content + '%' )
  end

  def create_notification_answer!(current_user, answer_id)
    # 自分以外に回答している人をすべて取得し、全員に通知を送る
    temp_ids = Answer.select(:user_id).where(question_id: id).where.not(user_id: current_user.id).distinct
    temp_ids.each do |temp_id|
      save_notification_answer!(current_user, answer_id, temp_id['user_id'])
    end
    # まだ誰も回答していない場合は、投稿者に通知を送る
    save_notification_answer!(current_user, answer_id, user_id) if temp_ids.blank?
  end

  def save_notification_answer!(current_user, answer_id, visited_id)
    # 回答は複数回することが考えられるため、１つの投稿に複数回通知する
    notification = current_user.active_notifications.new(
      question_id: id,
      answer_id: answer_id,
      visited_id: visited_id,
      action: 'answer'
    )
    # 自分の投稿に対する回答の場合は、通知済みとする
    if notification.visitor_id == notification.visited_id
      notification.checked = true
    end
    notification.save if notification.valid?
  end

end
