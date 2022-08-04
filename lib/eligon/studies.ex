defmodule Eligon.Studies do
  alias Eligon.Repo
  alias Eligon.Studies.StudyChapter
  alias Eligon.Studies.StudyLesson
  alias Eligon.Studies.StudyAdvance
  import Ecto.Query

  @doc """
  （chapter構造体と、それに対応するレッスン構造体リスト）のタプルのリストを返します。
  [{chapter構造体, [lesson構造体, lesson構造体, ...]}, ...]
  """
  def get_textbook() do
    query_chapter = from(c in StudyChapter, order_by: [asc: :index])
    chapters = Repo.all(query_chapter)
    for c <- chapters do
      query_lesson = from(l in StudyLesson, where: l.chapter_id == ^c.id, order_by: [asc: :index])
      lessons = Repo.all(query_lesson)
      {c, lessons}
    end
  end

  def insert_advances_at_registration(user_id) do

    query = from(StudyLesson)
    lessons = Repo.all(query)

    for l <- lessons do
      %StudyAdvance{}
      |> StudyAdvance.changeset(%{user_id: user_id, lesson_id: l.id, is_read: false})
      |> Repo.insert()
    end
  end

  @doc """
  user_idに応じて、すべてのadvances(読了チェックのテーブルの値)を
  持ってきます
  """
  def get_all_advances_by_userid(user_id) do
    query = from(a in StudyAdvance, where: a.user_id == ^user_id)

    Repo.all(query)
  end

  @doc """
  user_idとlesson_idから該当advance(一つしかないはず)を持ってきます。
  その後、flagの値で、is_readを書き換え、updateします。
  """
  def get_advance_and_update(user_id, lesson_id, flag) do
    query = from(a in StudyAdvance,
            where: a.user_id == ^user_id and a.lesson_id == ^lesson_id)

    [advance] = Repo.all(query)

    changeset_advance = StudyAdvance.changeset(advance, %{:is_read => flag})

    IO.inspect(changeset_advance)
    IO.inspect("updateできました")
    Repo.update(changeset_advance)
  end

end
