# frozen_string_literal: true

# require 'rails_helper'

# describe '質問のテスト' do
#   let!(:question) { create(:question, title:'hoge',content:'content') }

#   describe '質問一覧画面のテスト' do
#     before do
#       visit questions_path
#     end
#     context '表示の確認' do
#       it '質問一覧画面(questions_path)に「質問一覧」が表示されているか' do
#         expect(page).to have_content '質問一覧'
#       end
#       it 'questions_pathが"/questions"であるか' do
#         expect(current_path).to eq('/questions')
#       end
#       it '質問投稿画面へのリンクが存在しているか' do
#         expect(page).to have_link '質問フォーム'
#       end
#       it '回答受付中の質問画面へのリンクが存在しているか' do
#         expect(page).to have_link '回答受付中の質問はこちら'
#       end
#     end
#     context 'リンクの遷移先の確認' do
#       it '質問フォームへのリンクの遷移先は正しいか' do
#         new_question_link = find('質問フォーム')
#         new_question_link.click
#         expect(current_path).to eq('/questions/new')
#       end
#       it '回答受付中の質問画面へのリンクの遷移先は正しいか' do
#         unsolved_question_link = find('回答受付中の質問はこちら')
#         unsolved_question_link.click
#         expect(current_path).to eq('/questions/unsolved')
#       end
#     end
#   end

#   describe "質問投稿画面のテスト" do
#     before do
#       visit new_questions_path
#     end
#     context '表示の確認' do
#       it 'questions_new_pathが"/questions/new"であるか' do
#         expect(current_path).to eq('/questions/new')
#       end
#       it '投稿ボタンが表示されているか' do
#         expect(page).to have_button '質問する'
#       end
#     end
#     context '投稿処理のテスト' do
#       it '投稿後のリダイレクト先は正しいか' do
#         fill_in 'question[title]', with: Faker::Lorem.characters(number:10)
#         fill_in 'question[content]', with: Faker::Lorem.characters(number:30)
#         fill_in 'question[making_genre]', with: Faker::Lorem.characters(number:5)
#         fill_in 'question[bread_genre]', with: Faker::Lorem.characters(number:5)
#         click_button '質問する'
#         expect(page).to have_current_path question_path(Question.last)
#       end
#     end
#   end

#   describe "質問一覧画面のテスト" do
#     before do
#       visit questions_path
#     end
#     context '表示の確認' do
#       it '投稿されたものが表示されているか' do
#         expect(page).to have_content question.title
#         expect(page).to have_content question.content
#         expect(page).to have_content question.making_genre
#         expect(page).to have_content question.bread_genre
#       end
#     end
#   end

#   describe "質問詳細画面のテスト" do
#     before do
#       visit question_path(question)
#     end
#     context '表示の確認' do
#       it '削除リンクが存在しているか' do
#         expect(page).to have_link '削除'
#       end
#       it '編集リンクが存在しているか' do
#         expect(page).to have_link '編集'
#       end
#     end
#     context 'リンクの遷移先の確認' do
#       it '編集の遷移先は編集画面か' do
#         edit_link = find_all('編集')
#         edit_link.click
#         expect(current_path).to eq('/questions/' + question.id.to_s + '/edit')
#       end
#     end
#     context '質問削除のテスト' do
#       it '質問の削除' do
#         expect{ question.destroy }.to change{ Question.count }.by(-1)
#       end
#     end
#   end

#   describe '質問編集画面のテスト' do
#     before do
#       visit edit_question_path(question)
#     end
#     context '表示の確認' do
#       it '編集前のタイトルと本文とカテゴリがフォームに表示(セット)されている' do
#         expect(page).to have_field 'question[title]', with: question.title
#         expect(page).to have_field 'question[content]', with: question.content
#         expect(page).to have_field 'question[making_genre]', with: question.making_genre
#         expect(page).to have_field 'question[bread_genre]', with: question.bread_genre
#       end
#       it '保存ボタンが表示される' do
#         expect(page).to have_button '保存する'
#       end
#     end
#     context '更新処理に関するテスト' do
#       it '更新後のリダイレクト先は正しいか' do
#         fill_in 'question[title]', with: Faker::Lorem.characters(number:10)
#         fill_in 'question[content]', with: Faker::Lorem.characters(number:30)
#         fill_in 'question[making_genre]', with: Faker::Lorem.characters(number:5)
#         fill_in 'question[bread_genre]', with: Faker::Lorem.characters(number:5)
#         click_button '保存する'
#         expect(page).to have_current_path question_path(question)
#       end
#     end
#   end
# end

