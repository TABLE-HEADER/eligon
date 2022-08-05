defmodule Eligon.Repo do
  use Ecto.Repo,
    otp_app: :eligon,
    adapter: Ecto.Adapters.Postgres
end
