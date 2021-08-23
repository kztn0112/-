# frozen_string_literal: true

# require 'rails_helper'

# RSpec.describe Notification, "通知モデルに関するテスト", type: :model do
#   describe '通知モデルのテスト' do

#     let(:user) { create(:user) }
#     let(:making_genre) { create(:making_genre) }
#     let(:bread_genre) { create(:bread_genre) }
#     let(:question) { create(:question, user: user, making_genre: making_genre, bread_genre: bread_genre) }
#     let(:answer) { create(:answer, user: user, question: question) }
#     let(:notification) { create(:notification, user: user, question: question, answer: answer) }

#     it "通知が保存されるか" do
#       expect(notification).to be_valid
#     end

#   end
# end