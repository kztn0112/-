class BreadGenre < ApplicationRecord
  has_many :questions, dependent: :destroy

  enum bread_genre: {食パン:0, あんパン:1,メロンパン:2, クロワッサン:3, カレーパン:4, フランスパン:5,お惣菜パン:6, その他:7}
end
