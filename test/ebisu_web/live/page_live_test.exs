defmodule EbisuWeb.PageLiveTest do
  use EbisuWeb.ConnCase, async: true

  import Phoenix.LiveViewTest

  test "disconnected and connected render", %{conn: conn} do
    {:ok, page_live, disconnected_html} = live(conn, "/")
    assert disconnected_html =~ "<canvas id=\"chart\""
    assert render(page_live) =~ "<canvas id=\"chart\""
  end
end
