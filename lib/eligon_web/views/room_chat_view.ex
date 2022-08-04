defmodule EligonWeb.RoomChatView do
  use EligonWeb, :view

  def display_lines(inner_text, is_edited, is_deleted, assigns) do
    if is_deleted do
      ~H"""
        <font color='red'>削除しました</font>
      """
    else
      if is_edited do
        ~H"""
          <%= inner_text %>[<i>編集済</i>]
        """
      else
        ~H"""
          <%= inner_text %>
        """
      end
    end
  end

  def format_date(date) do
    date = NaiveDateTime.add(date, 60 * 60 * 9)
    Calendar.strftime(date, "%Y年%-m月%-d日 %H:%M")
  end
end
