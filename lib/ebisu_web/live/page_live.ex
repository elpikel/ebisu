defmodule EbisuWeb.PageLive do
  use EbisuWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end
end
