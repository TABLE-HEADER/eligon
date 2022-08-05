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
  %StudyLesson{chapter_id: 1, index: 1, lesson: "インストール", description: "Elixir, OTP等をインストールします。", link: "https://elixir-lang.jp/install.html"},
  %StudyLesson{chapter_id: 1, index: 2, lesson: "VS Codeのインストール", description: "コードエディタであるVS Codeをインストールします。", link: "https://www.javadrive.jp/vscode/install/index1.html"},

  %StudyLesson{chapter_id: 2, index: 1, lesson: "Hello Worldを表示してみよう", description: "簡単な文字列を表示できるようにしてみましょう。", link: "https://elixir-lang.jp/getting-started/introduction.html"},
  %StudyLesson{chapter_id: 2, index: 2, lesson: "基本", description: "Elixirの基本を学びましょう。", link: "https://elixirschool.com/ja/lessons/basics/basics"},
  %StudyLesson{chapter_id: 2, index: 3, lesson: "コレクション", description: "リスト、タプル、キーワードリスト、マップなど", link: "https://elixirschool.com/ja/lessons/basics/collections"},
  %StudyLesson{chapter_id: 2, index: 4, lesson: "Enum", description: "Elixirでよく使うEnumモジュールを学びましょう。", link: "https://elixirschool.com/ja/lessons/basics/enum"},
  %StudyLesson{chapter_id: 2, index: 5, lesson: "パターンマッチング", description: "Elixirの強みであるパターンマッチングを学びます。", link: "https://elixirschool.com/ja/lessons/basics/pattern_matching"},

  %StudyLesson{chapter_id: 3, index: 1, lesson: "OTPの並行性", description: "Elixirに組み込まれているOTPの振る舞いに目を向けます。", link: "https://elixirschool.com/ja/lessons/advanced/otp_concurrency"},
  %StudyLesson{chapter_id: 3, index: 2, lesson: "OTPスーパバイザ", description: "スーパバイザは、他のプロセスを監視するという一つの目的に特化したプロセスです。 ", link: "https://elixirschool.com/ja/lessons/advanced/otp_supervisors"},
  %StudyLesson{chapter_id: 3, index: 3, lesson: "OTPディストリビューション", description: "Elixirは、このレッスンで概説するいくつかの異なるメカニズムを通して、それらのノード間で通信をすることが可能です。", link: "https://elixirschool.com/ja/lessons/advanced/otp_distribution"},

  %StudyLesson{chapter_id: 4, index: 1, lesson: "Ectoの基本", description: "Ectoはデータベースラッパーと統合クエリ言語を提供するElixirの公式なプロジェクトです。", link: "https://elixirschool.com/ja/lessons/ecto/basics"},
  %StudyLesson{chapter_id: 4, index: 2, lesson: "チェンジセット", description: "データの挿入、更新等にチェンジセットが必要になります。", link: "https://elixirschool.com/ja/lessons/ecto/changesets"},
  %StudyLesson{chapter_id: 4, index: 3, lesson: "アソシエーション", description: "スキーマ間のアソシエーション定義を学びましょう。", link: "https://elixirschool.com/ja/lessons/ecto/associations"}
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
