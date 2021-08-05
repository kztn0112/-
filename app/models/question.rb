class Question < ApplicationRecord
  attachment :image
  belongs_to :user
  belongs_to :making_genre
  belongs_to :bread_genre
  has_many :answers, dependent: :destroy

  validates :title, presence: true
  validates :content, presence: true

  def self.search_for(content)
     Question.where('title LIKE ? OR content LIKE ?', '%'+content+'%' , '%'+content+'%' )
  end

end

