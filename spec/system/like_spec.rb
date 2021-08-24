require 'rails_helper'

describe 'いいねのテスト' do
  let(:user) { create(:user) }
  let(:making_genre) { create(:making_genre) }
  let(:bread_genre) { create(:bread_genre) }
  let(:question) { create(:question, user: user, making_genre: making_genre, bread_genre: bread_genre) }
  let(:answer) { create(:answer, user: user, question: question) }

  before do
    visit new_user_session_path
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_button 'ログイン'
    visit question_path(question)
  end

    context 'いいねボタンを押す場合' do
      it 'いいねが出来る' do
        find ('.far').click
        expect(Answer.likes.count).to change{ Answer.likes.count }.by(+1)
      end
    end

    context 'いいねを外す場合' do
      let(:like) { create(:like, user: user, answer: answer, question: question) }
      it 'いいねボタンを外す' do
        find ('.fas').click
        expect{ Answer.likes.count }.to change{ Answer.likes.count }.by(-1)
      end
    end
end