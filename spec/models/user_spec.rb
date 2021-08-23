# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, "会員モデルに関するテスト", type: :model do
  describe '実際に保存してみる' do
    it "有効なユーザー情報の場合は保存されるか" do
      user = build(:user)
      expect(FactoryBot.build(:user)).to be_valid
    end
    context "空白のバリデーションチェック" do
      it "名前が空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
        user = build(:user, name: nil)
        expect(user).to be_invalid
        expect(user.errors[:name]).to include("can't be blank")
      end
      it "メールアドレスが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
        user = build(:user, email: nil)
        expect(user).to be_invalid
        expect(user.errors[:email]).to include("can't be blank")
      end
      it "パスワードが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
        user = build(:user, password: nil)
        expect(user).to be_invalid
        expect(user.errors[:password]).to include("can't be blank")
      end
    end
  end
end
