class MakingGenre < ApplicationRecord
  has_many :questions, dependent: :destroy

  enum making_genre: {材料:0, 混ぜる:1,発酵:2, 分割:3, 成形:4, 焼く:5,保管:6, その他:7}
end
