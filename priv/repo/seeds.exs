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
  %StudyChapter{index: 1, title: "Elixir基礎"}
]

lessons = [
  %StudyLesson{chapter_id: 1, index: 1, lesson: "基本", link: "https://elixirschool.com/ja/lessons/basics/basics"},
  %StudyLesson{chapter_id: 1, index: 2, lesson: "コレクション", link: "https://elixirschool.com/ja/lessons/basics/collections"},
  %StudyLesson{chapter_id: 1, index: 3, lesson: "Enum", link: "https://elixirschool.com/ja/lessons/basics/enum"}
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
