defmodule Eligon.MeetingFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Eligon.Meeting` context.
  """

  @doc """
  Generate a board.
  """
  def board_fixture(attrs \\ %{}) do
    {:ok, board} =
      attrs
      |> Enum.into(%{
        description: "some description",
        name: "some name"
      })
      |> Eligon.Meeting.create_board()

    board
  end
end
