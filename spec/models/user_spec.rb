# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, "会員モデルに関するテスト", type: :model do
  describe '実際に保存してみる' do

    context "有効なユーザー情報の場合" do
      let(:user) {build(:user)}
      it "ユーザーが登録されるか" do
        expect(user).to be_valid
      end
    end

    context "ユーザーの名前に空白がある場合" do
      let(:user) { build(:user, name: nil) }
      it "バリデーションチェックされ空白のエラーメッセージが返ってくるか" do
        expect(user).to be_invalid
        expect(user.errors[:name]).to include("can't be blank")
      end
    end
    context "メールアドレスに空白がある場合" do
      let(:user) { build(:user, email: nil) }
      it "バリデーションチェックされ空白のエラーメッセージが返ってくるか" do
        expect(user).to be_invalid
        expect(user.errors[:email]).to include("can't be blank")
      end
    end
    context "パスワードに空白がある場合" do
      let(:user) { build(:user, password: nil) }
      it "バリデーションチェックされ空白のエラーメッセージが返ってくるか" do
        expect(user).to be_invalid
        expect(user.errors[:password]).to include("can't be blank")
      end
    end

  end
end
