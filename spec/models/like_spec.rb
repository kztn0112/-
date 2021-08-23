# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Like, "いいねモデルに関するテスト", type: :model do
  describe 'いいねモデルのテスト' do

    let(:user) { create(:user) }
    let(:making_genre) { create(:making_genre) }
    let(:bread_genre) { create(:bread_genre) }
    let(:answer) { create(:answer, user: user, question: question) }
    let(:question) { create(:question, user: user, making_genre: making_genre, bread_genre: bread_genre) }
    let(:like) { build(:like, user: user, answer: answer) }

    it "いいねが保存されるか" do
      expect(like).to be_valid
    end

  end
end