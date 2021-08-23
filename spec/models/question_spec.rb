# # frozen_string_literal: true

require 'rails_helper'

RSpec.describe Question, "質問モデルに関するテスト", type: :model do
  describe '実際に保存してみる' do

    let(:user) { create(:user) }
    let(:making_genre) { create(:making_genre) }
    let(:bread_genre) { create(:bread_genre) }

    it "有効な投稿内容の場合は保存されるか" do
      question = build(:question, user_id: user.id, making_genre_id: making_genre.id, bread_genre_id: bread_genre.id)
      expect(question).to be_valid
    end
    context "空白のバリデーションチェック" do
      it "タイトルが空白の場合にバリデーションチェックされる" do
        question = build(:question, title: nil, user_id: user.id, making_genre_id: making_genre.id, bread_genre_id: bread_genre.id)
        expect(question).to be_invalid
      end
      it "本文が空白の場合にバリデーションチェックされる" do
        question = build(:question, content: nil,user_id: user.id, making_genre_id: making_genre.id, bread_genre_id: bread_genre.id)
        expect(question).to be_invalid
      end
      it "製作カテゴリが空白の場合にバリデーションチェックされる" do
        question = build(:question, making_genre_id: nil,user_id: user.id, bread_genre_id: bread_genre.id)
        expect(question).to be_invalid
      end
      it "パンの種類カテゴリが空白の場合にバリデーションチェックされる" do
        question = build(:question, bread_genre_id: nil,user_id: user.id, making_genre_id: making_genre.id)
        expect(question).to be_invalid
      end
    end
  end
end