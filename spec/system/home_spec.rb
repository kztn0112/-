require 'rails_helper'

describe 'トップ画面とジャンル検索画面のテスト' do
  describe 'トップ画面のテスト' do
    before do
      visit root_path
    end
    context '表示の確認' do
      it 'トップ画面に「ようこそ、おパンへ！」が表示されているか' do
        expect(page).to have_content 'ようこそ、おパンへ！'
      end
      it '会員新規登録画面へのリンクが存在しているか' do
        expect(page).to have_link '新規登録', href: new_user_registration_path
      end
      it 'root_pathが"/"であるか' do
	      expect(current_path).to eq('/')
	    end
    end
  end

  describe 'ジャンル検索画面のテスト' do
    let!(:user) { create(:user) }
    let!(:making_genre) { create(:making_genre) }
    let!(:bread_genre) { create(:bread_genre) }
    before do
      visit new_user_session_path
      fill_in 'user[name]', with: user.name
      fill_in 'user[password]', with: user.password
      click_button 'ログイン'
      visit homes_path
    end
    context '表示の確認' do
      it 'ジャンル検索画面に「ジャンル検索」が表示されているか' do
        expect(page).to have_content 'ジャンル検索'
      end
      it '各ジャンルの名前のリンクが存在しているか' do
        expect(page).to have_link making_genre.name
        expect(page).to have_link bread_genre.name
      end
    end

    context 'リンクの遷移先の確認' do
      it 'パンの製作工程による検索結果へのリンクの遷移先は正しいか' do
        click_link making_genre.name
        expect(current_url).to eq(current_host+'/questions?genre=' + making_genre.id.to_s + '&type=making')
      end
      it 'パンの種類による検索結果へのリンクの遷移先は正しいか' do
        click_link bread_genre.name
        expect(current_url).to eq(current_host+'/questions?genre=' + bread_genre.id.to_s + '&type=bread')
      end
    end
  end
end
