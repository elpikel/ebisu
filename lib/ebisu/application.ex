defmodule Ebisu.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  alias Ebisu.Bitbay.Worker.Ticker, as: BitbayTicker

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Ebisu.Repo,
      # Start the Telemetry supervisor
      EbisuWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Ebisu.PubSub},
      # Start the Endpoint (http/https)
      EbisuWeb.Endpoint,
      # Start a worker by calling: Ebisu.Worker.start_link(arg)
      # {Ebisu.Worker, arg}
      BitbayTicker
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Ebisu.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    EbisuWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
