require 'rails_helper'

describe '質問のテスト' do
  let!(:user) { create(:user) }
  let!(:making_genre) { create(:making_genre) }
  let!(:bread_genre) { create(:bread_genre) }
  let!(:question) { create(:question, user: user, making_genre: making_genre, bread_genre: bread_genre)}

  before do
    visit new_user_session_path
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_button 'ログイン'
  end

  describe '質問一覧画面のテスト' do
    before do
      visit questions_path
    end
    context '表示の確認' do
      it '質問一覧画面(questions_path)に「質問一覧」が表示されているか' do
        expect(page).to have_content '質問一覧'
      end
      it 'questions_pathが"/questions"であるか' do
        expect(current_path).to eq('/questions')
      end
      it '質問投稿画面へのリンクが存在しているか' do
        expect(page).to have_link '質問フォーム', href: new_question_path
      end
      it '回答受付中の質問画面へのリンクが存在しているか' do
        expect(page).to have_link '回答受付中の質問はこちら', href: unsolved_questions_path
      end
    end
  end

  describe "質問投稿画面のテスト" do
    before do
      visit new_question_path
    end
    context '表示の確認' do
      it 'questions_new_pathが"/questions/new"であるか' do
        expect(current_path).to eq('/questions/new')
      end
      it '投稿ボタンが表示されているか' do
        expect(page).to have_button '質問する'
      end
    end
    context '投稿処理のテスト' do
      it '投稿後のリダイレクト先は正しいか' do
        fill_in 'question[title]', with: Faker::Lorem.characters(number:10)
        fill_in 'question[content]', with: Faker::Lorem.characters(number:30)
        choose 'question_making_genre_id_1'
        choose 'question_bread_genre_id_1'
        click_button '質問する'
        expect(current_path).to eq '/questions/' + Question.last.id.to_s
      end
    end
  end

  describe "質問一覧画面のテスト" do
    before do
      visit questions_path
    end
    context '表示の確認' do
      it '投稿されたものが表示されているか' do
        expect(page).to have_content question.title
      end
    end
  end

  describe "質問詳細画面のテスト" do
    before do
      visit question_path(question)
    end
    context '表示の確認' do
      it '削除リンクが存在しているか' do
        expect(page).to have_link '削除', href: question_path(question)
      end
      it '編集リンクが存在しているか' do
        expect(page).to have_link '編集', href: edit_question_path(question)
      end
    end
    context '質問削除のテスト' do
      it '質問の削除' do
        expect{ question.destroy }.to change{ Question.count }.by(-1)
      end
    end
  end

  describe '質問編集画面のテスト' do
    before do
      visit edit_question_path(question)
    end
    context '表示の確認' do
      it '編集前のタイトルと本文とカテゴリがフォームに表示(セット)されている' do
        expect(page).to have_field 'question[title]', with: question.title
        expect(page).to have_field 'question[content]', with: question.content
        expect(page).to have_checked_field 'question[making_genre_id]', with: question.making_genre_id
        expect(page).to have_checked_field 'question[bread_genre_id]', with: question.bread_genre_id
      end
      it '保存ボタンが表示される' do
        expect(page).to have_button '保存する'
      end
    end
    context '更新処理に関するテスト' do
      it '更新後のリダイレクト先は正しいか' do
        fill_in 'question[title]', with: Faker::Lorem.characters(number:10)
        fill_in 'question[content]', with: Faker::Lorem.characters(number:30)
        choose 'question_making_genre_id_1'
        choose 'question_bread_genre_id_1'
        click_button '保存する'
        expect(page).to have_current_path question_path(question)
      end
    end
  end
end

