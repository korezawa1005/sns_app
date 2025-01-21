# ユーザーを50件作成
50.times do
  User.create!(
    email: Faker::Internet.unique.email, # Fakerで一意のメールアドレスを生成
    password: 'password',                # 全員に共通のパスワードを設定
    password_confirmation: 'password'    # パスワード確認も同じ値
  )
end

# 投稿を50件作成
50.times do
  Post.create!(
    user: User.offset(rand(User.count)).first, # ランダムなユーザーを選択
    title: Faker::Lorem.sentence,              # ランダムなタイトルを生成
    content: Faker::Lorem.paragraph            # ランダムな本文を生成
  )
end
