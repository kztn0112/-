# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)




User.create!(
  [
    {
      email: 'user1@gmail.com',
      password: 'test123',
      password_confirmation: "test123",
      name: '山田太郎',
      introduction: 'パン作り初心者です！よろしくお願いします。',
      profile_image: File.open('./app/assets/images/user1.png')
    },
    {
      email: 'user2@gmail.com',
      password: 'test123',
      password_confirmation: "test123",
      name: '山田花子',
      introduction: 'パン作り初心者です！よろしくお願いします。',
      profile_image: File.open('./app/assets/images/user2.png')
    }
  ]
)

MakingGenre.create!(
 [
    {name: '材料'},{name: '生地作り'},{name: '発酵'},{name: '成形'},{name: '焼成'},{name: 'その他'}
  ]
)

BreadGenre.create!(
 [
    {name: '食パン'},{name: '餡パン'},{name: 'メロンパン'},{name: 'クロワッサン'},{name: 'カレーパン'},{name: 'フランスパン'},{name: 'クリームパン'},{name: 'お惣菜パン'},{name: 'その他'}
  ]
)

User.all.each do |user|
  user.questions.create!(
    [
      {
        title: '食パンについて',
        content: '食パンについての質問です',
        user_id: 1,
        making_genre_id: 1,
        bread_genre_id: 1,
        image: File.open('./app/assets/images/bread1.jpg'),
        is_resolved: false
      },
      {
        title: '餡パンについて',
        content: '餡パンについての質問です',
        user_id: 1,
        making_genre_id: 1,
        bread_genre_id: 2,
        image: File.open('./app/assets/images/bread1.jpg'),
        is_resolved: false
      },
      {
        title: 'メロンパンについ',
        content: 'メロンパンについての質問です',
        user_id: 1,
        making_genre_id: 1,
        bread_genre_id: 3,
        image: File.open('./app/assets/images/bread1.jpg'),
        is_resolved: false
      }
    ]
  )
end

