defmodule Metis.Application do
  @moduledoc """
  Main entry point of the app
  """

  use Application

  def start(_type, _args) do
    children = [
      Metis.Repo,
      {Phoenix.PubSub, [name: Metis.PubSub, adapter: Phoenix.PubSub.PG2]},
      MetisWeb.Endpoint
    ]

    opts = [strategy: :one_for_one, name: Metis.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def config_change(changed, _new, removed) do
    MetisWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
