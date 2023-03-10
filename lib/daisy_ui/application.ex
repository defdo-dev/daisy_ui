defmodule DaisyUi.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      DaisyUiWeb.Telemetry,

      # Start the PubSub system
      {Phoenix.PubSub, name: DaisyUi.PubSub},
    ]
    |> maybe_start_endpoint()

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: DaisyUi.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    DaisyUiWeb.Endpoint.config_change(changed, removed)
    :ok
  end

  defp maybe_start_endpoint(children), do:
    # Start the Endpoint (http/https)
    maybe_append(children, DaisyUiWeb.Endpoint)

  defp maybe_append(children, child) when is_list(children) and is_atom(child) do
    if Application.get_env(:daisy_ui, child) do
      [child | children]
    else
      children
    end
  end
end
