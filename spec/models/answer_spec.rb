# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Answer, "回答モデルに関するテスト", type: :model do
  describe '実際に保存してみる' do

    let(:user) { create(:user) }
    let(:question) { create(:question, user: user, making_genre: making_genre, bread_genre: bread_genre) }
    let(:making_genre) { create(:making_genre) }
    let(:bread_genre) { create(:bread_genre) }

    context "有効な回答の場合" do
      let(:answer) { build(:answer, user: user, question: question)}
      it "回答が保存されるか" do
        expect(answer).to be_valid
      end
    end
    context "回答が空白の場合" do
      let(:answer) { build(:answer, content: nil, user: user, question: question) }
      it "バリデーションチェックされる" do
        expect(answer).to be_invalid
      end
    end

  end
end
