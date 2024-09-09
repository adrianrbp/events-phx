defmodule Events.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Events.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Events.PubSub}
      # Start a worker by calling: Events.Worker.start_link(arg)
      # {Events.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: Events.Supervisor)
  end
end
