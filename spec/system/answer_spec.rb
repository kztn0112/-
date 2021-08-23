# frozen_string_literal: true

# require 'rails_helper'

# describe '回答のテスト' do
#   let!(:question) { create(:question, title:'hoge',content:'content', making_genre:'making', bread_genre:'bread') }
#   let!(:answer) { create(:answer,content:'content') }
#   before do
#     visit question_path(question)
#   end
#     context '表示の確認' do
#       it '回答ボタンが表示されているか' do
#         expect(page).to have_button '回答する'
#       end
#     end
#     context '回答処理のテスト' do
#       it '回答後のリダイレクト先は正しいか' do
#         fill_in 'answer[content]', with: Faker::Lorem.characters(number:30)
#         click_button '回答する'
#         expect(page).to have_current_path question_path(question)
#       end
#     end
#     context '表示の確認' do
#       it '回答されたものが表示されているか' do
#         expect(page).to have_content answer.content
#       end
#     end
#   end
