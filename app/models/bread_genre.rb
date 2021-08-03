class BreadGenre < ApplicationRecord
  has_many :questions, dependent: :destroy

  enum name: {食パン:0, 餡パン:1, メロンパン:2, クロワッサン:3, カレーパン:4, フランスパン:5,クリームパン:6, お惣菜パン:7, その他:8}
end
