defmodule Eligon.Studies do
  alias Eligon.Repo
  alias Eligon.Studies.StudyChapter
  alias Eligon.Studies.StudyLesson
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
end
