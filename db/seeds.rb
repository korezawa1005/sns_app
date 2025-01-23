# ユーザーを作成
50.times do
  User.create!(
    email: Faker::Internet.unique.email,
    password: 'password',
    password_confirmation: 'password'
  )
end

# 投稿を作成
if User.exists?
  50.times do
    Post.create!(
      user: User.order('RANDOM()').first, # ランダムなユーザーを選択
      title: Faker::Lorem.sentence,
      content: Faker::Lorem.paragraph
    )
  end
else
  puts "ユーザーが存在しないため投稿を作成できません"
end

# コメントを作成
if Post.exists? && User.exists?
  100.times do
    Comment.create!(
      user: User.order('RANDOM()').first,
      post: Post.order('RANDOM()').first,
      content: Faker::Lorem.sentence
    )
  end
else
  puts "投稿またはユーザーが存在しないためコメントを作成できません"
end
