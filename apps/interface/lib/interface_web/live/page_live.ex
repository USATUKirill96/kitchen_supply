defmodule InterfaceWeb.PageLive do
  use InterfaceWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    templates = Orders.Templates.list()
    {:ok, assign(socket, templates: templates)}
  end
end
