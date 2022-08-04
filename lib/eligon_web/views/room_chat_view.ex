defmodule EligonWeb.RoomChatView do
  use EligonWeb, :view

  def add_lines(inner_text), do: String.replace(inner_text, ~r/\r\n|\n|\r/, "<br>")

  def format_date(date) do
    date = NaiveDateTime.add(date, 60 * 60 * 9)
    Calendar.strftime(date, "%Y年%-m月%-d日 %H:%M")
  end
end
