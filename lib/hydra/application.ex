defmodule Hydra.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do

    children = [
      # Start the Ecto repository
      Hydra.Repo,
      # Start the Telemetry supervisor
      HydraWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Hydra.PubSub},
      # Start the Endpoint (http/https)
      HydraWeb.Endpoint,
      :poolboy.child_spec(:worker, Application.get_env(:hydra, :mongo_poolboy)),
      {Hydra.Pickings.Workers.ConsumeProductsFromKafka,Application.get_env(:hydra , :picking_consumer)},
      # Start a worker by calling: Hydra.Worker.start_link(arg)
      # {Hydra.Worker, arg}
      {Mongo, Application.get_env(:hydra , :mongo_config)}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Hydra.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    HydraWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
