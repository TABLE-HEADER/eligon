# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Eligon.Repo.insert!(%Eligon.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Eligon.Studies.StudyChapter
alias Eligon.Studies.StudyLesson
alias Eligon.Repo

alias Eligon.Users.User
alias Eligon.Chats.Chat

chapters = [
  %StudyChapter{index: 1, title: "Elixir環境構築"},
  %StudyChapter{index: 2, title: "Elixir基礎"},
  %StudyChapter{index: 3, title: "Elixir発展"},
  %StudyChapter{index: 4, title: "Ecto基礎"}
]

lessons = [
  %StudyLesson{chapter_id: 1, index: 1, lesson: "インストール", link: "https://elixir-lang.jp/install.html"},
  %StudyLesson{chapter_id: 1, index: 2, lesson: "VS Codeのインストール", link: "https://www.javadrive.jp/vscode/install/index1.html"},

  %StudyLesson{chapter_id: 2, index: 1, lesson: "Hello Worldを表示してみよう", link: "https://elixir-lang.jp/getting-started/introduction.html"},
  %StudyLesson{chapter_id: 2, index: 2, lesson: "基本", link: "https://elixirschool.com/ja/lessons/basics/basics"},
  %StudyLesson{chapter_id: 2, index: 3, lesson: "コレクション", link: "https://elixirschool.com/ja/lessons/basics/collections"},
  %StudyLesson{chapter_id: 2, index: 4, lesson: "Enum", link: "https://elixirschool.com/ja/lessons/basics/enum"},
  %StudyLesson{chapter_id: 2, index: 5, lesson: "パターンマッチング", link: "https://elixirschool.com/ja/lessons/basics/pattern_matching"},

  %StudyLesson{chapter_id: 3, index: 1, lesson: "OTPの並行性", link: "https://elixirschool.com/ja/lessons/advanced/otp_concurrency"},
  %StudyLesson{chapter_id: 3, index: 2, lesson: "OTPスーパバイザ", link: "https://elixirschool.com/ja/lessons/advanced/otp_supervisors"},
  %StudyLesson{chapter_id: 3, index: 3, lesson: "OTPディストリビューション", link: "https://elixirschool.com/ja/lessons/advanced/otp_distribution"},

  %StudyLesson{chapter_id: 4, index: 1, lesson: "Ectoの基本", link: "https://elixirschool.com/ja/lessons/ecto/basics"},
  %StudyLesson{chapter_id: 4, index: 2, lesson: "チェンジセット", link: "https://elixirschool.com/ja/lessons/ecto/changesets"},
  %StudyLesson{chapter_id: 4, index: 3, lesson: "アソシエーション", link: "https://elixirschool.com/ja/lessons/ecto/associations"}
]

Enum.each(chapters, &(Repo.insert(&1)))
Enum.each(lessons, &(Repo.insert(&1)))

users = [
  User.registration_changeset(%User{}, %{email: "test01@gmail.com", nickname: "user01", password: "testtesttest"}),
  User.registration_changeset(%User{}, %{email: "test02@gmail.com", nickname: "user02", password: "testtesttest"}),
  User.registration_changeset(%User{}, %{email: "test03@gmail.com", nickname: "user03", password: "testtesttest"})
]

chats = [
  %Chat{user_id: 1, inner_text: "こんにちは！"},
  %Chat{user_id: 2, inner_text: "こんにちは！"},
  %Chat{user_id: 3, inner_text: "今日はいい\n天気ですね"},
  %Chat{user_id: 2, inner_text: "こんばんは！"},
  %Chat{user_id: 1, inner_text: "こんばんは！"}
]

Enum.each(users, &(Repo.insert(&1)))
Enum.each(chats, &(Repo.insert(&1)))

# 3人分の読了チェック(advance)を作ります。すべてfalseの状態です。
Eligon.Studies.insert_advances_at_registration(1)
Eligon.Studies.insert_advances_at_registration(2)
Eligon.Studies.insert_advances_at_registration(3)
