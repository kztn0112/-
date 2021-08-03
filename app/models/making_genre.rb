class MakingGenre < ApplicationRecord
  has_many :questions, dependent: :destroy

  enum name: {材料:0, 生地作り:1, 発酵:2, 成形:3, 焼成:4, その他:5}
end
