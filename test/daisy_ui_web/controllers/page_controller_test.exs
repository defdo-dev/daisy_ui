defmodule DaisyUiWeb.PageControllerTest do
  use DaisyUiWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "defdo"
  end
end
