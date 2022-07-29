defmodule Eligon.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Eligon.Repo,
      # Start the Telemetry supervisor
      EligonWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Eligon.PubSub},
      # Start the Endpoint (http/https)
      EligonWeb.Endpoint
      # Start a worker by calling: Eligon.Worker.start_link(arg)
      # {Eligon.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Eligon.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    EligonWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
