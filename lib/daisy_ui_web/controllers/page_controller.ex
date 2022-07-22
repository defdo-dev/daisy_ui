defmodule DaisyUiWeb.PageController do
  use DaisyUiWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
