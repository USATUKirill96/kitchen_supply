defmodule InterfaceWeb.TemplateLive do
  use InterfaceWeb, :live_view

  alias Orders.Templates

  @impl true
  def mount(%{"id" => id}, _session, socket) do
    {:ok, template} = Templates.get(id)
    {:ok, assign(socket, template: template)}
  end
end
