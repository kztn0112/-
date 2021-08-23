# # frozen_string_literal: true

require 'rails_helper'

RSpec.describe Answer, "回答モデルに関するテスト", type: :model do
  describe '実際に保存してみる' do

    let(:user) { create(:user) }
    let(:question) { create(:question) }
    let(:making_genre) { create(:making_genre) }
    let(:bread_genre) { create(:bread_genre) }

    it "有効な投稿内容の場合は保存されるか" do
      answer = build(:answer, user_id: user.id, question_id: question.id)
      expect(answer).to be_valid
    end
    context "空白のバリデーションチェック" do
      it "contentが空白の場合にバリデーションチェックされる" do
        answer = build(:answer, content: nil, user_id: user.id, question_id: question.id)
        expect(answer).to be_invalid
        # expect(answer.errors[:content]).to include("回答を入力してください")
      end
    end
  end
end