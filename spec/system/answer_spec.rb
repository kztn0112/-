# frozen_string_literal: true

require 'rails_helper'

describe '回答のテスト' do
  let!(:user) { create(:user) }
  let!(:making_genre) { create(:making_genre) }
  let!(:bread_genre) { create(:bread_genre) }
  let!(:question) { create(:question, user: user, making_genre: making_genre, bread_genre: bread_genre) }
  let!(:answer) { create(:answer,user: user, question: question) }

  describe '回答のテスト' do

    before do
      visit new_user_session_path
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password
      click_button 'ログイン'
      visit question_path(question)
    end

    context '表示の確認' do
      it '回答ボタンが表示されているか' do
        expect(page).to have_button '回答する'
      end
    end
    context '回答処理のテスト' do
      it '回答後のリダイレクト先は正しいか' do
        fill_in 'answer[content]', with: Faker::Lorem.characters(number:30)
        click_button '回答する'
        expect(page).to have_current_path question_path(question)
      end
      it '回答後にサクセスメッセージが含まれるか' do
        fill_in 'answer[content]', with: Faker::Lorem.characters(number:30)
        click_button '回答する'
        expect(page).to have_content '回答しました'
      end
    end
    context '表示の確認' do
      it '回答されたものが表示されているか' do
        expect(page).to have_content answer.content
      end
    end
  end
end
