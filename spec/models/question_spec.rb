# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Question, "質問モデルに関するテスト", type: :model do
  describe '実際に保存してみる' do

    let(:user) { create(:user) }
    let(:making_genre) { create(:making_genre) }
    let(:bread_genre) { create(:bread_genre) }

    context "有効な質問の場合" do
      let(:question) { build(:question, user: user, making_genre: making_genre, bread_genre: bread_genre) }
      it "質問が保存されるか" do
        expect(question).to be_valid
      end
    end
    context "タイトルに空白がある場合" do
      let(:question) { build(:question, title: nil, user: user, making_genre: making_genre, bread_genre: bread_genre) }
      it "バリデーションチェックされる" do
        expect(question).to be_invalid
      end
    end
    context "本文に空白がある場合" do
      let(:question) { build(:question, content: nil, user: user, making_genre: making_genre, bread_genre: bread_genre) }
      it "バリデーションチェックされる" do
        expect(question).to be_invalid
      end
    end
    context "製作カテゴリを選択していない場合" do
      let(:question) { build(:question, making_genre: nil, user: user, bread_genre: bread_genre) }
      it "バリデーションチェックされる" do
        expect(question).to be_invalid
      end
    end
    context "パンの製作カテゴリを選択していない場合" do
      let(:question) { build(:question, bread_genre: nil, user: user, making_genre: making_genre) }
      it "バリデーションチェックされる" do
        expect(question).to be_invalid
      end
    end

  end
end