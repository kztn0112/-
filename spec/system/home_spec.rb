# frozen_string_literal: true

# frozen_string_literal: true

# require 'rails_helper'

# describe 'トップ画面とカテゴリ一覧のテスト' do
#   describe 'トップ画面のテスト' do
#   before do
#     root_path
#   end
#     context '表示の確認' do
#       it 'トップ画面に「ようこそ、おパンへ！」が表示されているか' do
#         expect(page).to have_content 'ようこそ、おパンへ！'
#       end
#       it '会員新規登録画面へのリンクが存在しているか' do
#         expect(page).to have_link '新規登録'
#       end
#     end
#     context 'リンクの遷移先の確認' do
#       it '会員新規登録画面へのリンクの遷移先は正しいか' do
#         registration_link = find('新規登録')
#         registration_link.click
#         expect(current_path).to eq('/users/sign_up')
#       end
#     end
#   end

#   describe 'カテゴリ一覧画面のテスト' do
#   before do
#     homes_path
#   end
#     context '表示の確認' do
#       it 'カテゴリ画面に「カテゴリ一覧」が表示されているか' do
#         expect(page).to have_content 'カテゴリ一覧'
#       end
#       it 'カテゴリ検索結果へのリンクが存在しているか' do
#         expect(page).to have_link making_genre.name
#         expect(page).to have_link bread_genre.name
#       end
#     end
#     context 'リンクの遷移先の確認' do
#       it 'パンの製作カテゴリの検索結果へのリンクの遷移先は正しいか' do
#         making_genre_link = find(making_genre.name)
#         making_genre_link.click
#         expect(current_path).to eq('/questions?genre=' + making_genre.id.to_s + '&type=making')
#       end
#       it 'パンの種類カテゴリの検索結果へのリンクの遷移先は正しいか' do
#         bread_genre_link = find(bread_genre.name)
#         bread_genre_link.click
#         expect(current_path).to eq('/questions?genre=' + bread_genre.id.to_s + '&type=bread')
#       end
#     end
#   end
# end
