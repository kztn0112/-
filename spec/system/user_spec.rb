require 'rails_helper'

describe 'ユーザーのテスト' do

  describe 'ユーザー登録のテスト' do
    it 'ユーザー登録は出来るか' do
      visit new_user_registration_path
      fill_in "お名前", with: "AA"
      fill_in "メールアドレス", with: "aaa@gmail.com"
      fill_in "パスワード", with: "0000000"
      fill_in "パスワード(再確認)", with: "0000000"
      click_button "新規登録"
    end
    it 'ログイン出来ないか' do
      visit new_user_session_path
      fill_in "メールアドレス", with: "bbb@gmail.com"
      fill_in "パスワード", with: "111111"
      click_button "ログイン"
      expect(page).to have_content "Invalid Email or password."
    end
  end

  describe "プロフィール画面のテスト" do
    let!(:user) {create(:user)}
    before do
      visit new_user_session_path
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password
      click_button 'ログイン'
      visit user_path(user)
    end
    context '表示の確認' do
      it 'user_path(user)が"/users/user.id"であるか' do
        expect(current_path).to eq ('/users/' + user.id.to_s)
      end
      it '氏名・自己紹介・編集リンク・質問履歴リンクが表示されているか' do
      expect(page).to have_content user.name
      expect(page).to have_content user.introduction
      expect(page).to have_link 'プロフィール編集'
      expect(page).to have_button '質問履歴を見る'
      end
    end
    context 'リンクの遷移先の確認' do
      it 'プロフィール編集の遷移先は編集画面か' do
        expect(page).to have_link 'プロフィール編集', href: edit_user_path(user)
      end
    end
  end

  describe "プロフィール編集画面のテスト" do
    let!(:user) {create(:user)}
    before do
      visit new_user_session_path
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password
      click_button 'ログイン'
      visit edit_user_path(user)
    end
    context '表示の確認' do
      it 'edit_user_path(user)が"/users/user.id/edit"であるか' do
        expect(current_path).to eq ('/users/' + user.id.to_s + '/edit' )
      end
      it '編集前のタイトルと自己紹介がフォームに表示(セット)されている' do
        expect(page).to have_field 'user[name]', with: user.name
        expect(page).to have_field 'user[introduction]', with: user.introduction
      end
      it '保存ボタンが表示される' do
        expect(page).to have_button '保存する'
      end
    end
    context '更新処理に関するテスト' do
      it '更新後のリダイレクト先は正しいか' do
        fill_in 'user[name]', with: Faker::Lorem.characters(number:5)
        fill_in 'user[introduction]', with: Faker::Lorem.characters(number:30)
        click_button '保存する'
        expect(page).to have_current_path user_path(user)
      end
    end
  end

end
