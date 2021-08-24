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
      email: 'taro@gmail.com',
      password: 'panpanpan',
      password_confirmation: "panpanpan",
      name: '山田太郎',
      introduction: 'パン作り初心者です！よろしくお願いします。',
      profile_image: File.open('./app/assets/images/user1.png')
    },
    {
      email: 'hana@gmail.com',
      password: 'panpanpan',
      password_confirmation: "panpanpan",
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
    {name: '食パン'},{name: 'あんパン'},{name: 'メロンパン'},{name: 'クロワッサン'},{name: 'カレーパン'},{name: 'フランスパン'},{name: 'クリームパン'},{name: 'お惣菜パン'},{name: 'その他のパン'}
  ]
)

User.all.each do |user|
  user.questions.create!(
    [
      {
        title: '食パンについて',
        content: '食パンについての質問です。食パンについての質問です。食パンについての質問です。',
        making_genre_id: 1,
        bread_genre_id: 1,
        image: File.open('./app/assets/images/image1.jpg'),
        is_resolved: false
      },
      {
        title: 'あんパンについて',
        content: 'あんパンについての質問です。あんパンについての質問です。あんパンについての質問です。',
        making_genre_id: 1,
        bread_genre_id: 2,
        image: File.open('./app/assets/images/image1.jpg'),
        is_resolved: false
      },
      {
        title: 'メロンパンについて',
        content: 'メロンパンについての質問です。メロンパンについての質問です。メロンパンについての質問です。',
        making_genre_id: 2,
        bread_genre_id: 3,
        image: File.open('./app/assets/images/image2.jpg'),
        is_resolved: false
      },
      {
        title: 'クロワッサンについて',
        content: 'クロワッサンについての質問です。クロワッサンについての質問です。クロワッサンについての質問です。',
        making_genre_id: 2,
        bread_genre_id: 4,
        image: File.open('./app/assets/images/image2.jpg'),
        is_resolved: false
      },
      {
        title: 'カレーパンについて',
        content: 'カレーパンについての質問です。カレーパンについての質問です。カレーパンについての質問です。',
        making_genre_id: 3,
        bread_genre_id: 5,
        image: File.open('./app/assets/images/image3.jpg'),
        is_resolved: false
      },
      {
        title: 'フランスパンについて',
        content: 'フランスパンについての質問です。フランスパンについての質問です。フランスパンについての質問です。',
        making_genre_id: 3,
        bread_genre_id: 6,
        image: File.open('./app/assets/images/image3.jpg'),
        is_resolved: false
      },
      {
        title: 'クリームパンについて',
        content: 'クリームパンについての質問です。クリームパンについての質問です。クリームパンについての質問です。',
        making_genre_id: 4,
        bread_genre_id: 7,
        image: File.open('./app/assets/images/image4.jpg'),
        is_resolved: false
      },
      {
        title: 'お惣菜パンについて',
        content: 'お惣菜パンについての質問です。お惣菜パンについての質問です。お惣菜パンについての質問です。',
        making_genre_id: 5,
        bread_genre_id: 8,
        image: File.open('./app/assets/images/image5.jpg'),
        is_resolved: false
      },
      {
        title: 'その他のパンについて',
        content: 'その他のパンについての質問です。その他のパンについての質問です。その他のパンについての質問です。',
        making_genre_id: 5,
        bread_genre_id: 9,
        image: File.open('./app/assets/images/image6.jpg'),
        is_resolved: false
      }
    ]
  )
end

