defmodule LiveViewHooksWeb.PlannerLive do
  use Phoenix.LiveView,
    layout: {LiveViewHooksWeb.LayoutView, "live.html"}

  alias LiveViewHooks.Events

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(_params, _url, socket) do
    {:noreply, socket}
  end

  @impl true
  def handle_event("insert_event", _params, socket) do
    title = "My created event"
    start_event = DateTime.utc_now()
    end_event = DateTime.add(start_event, 3600, :second)
    {:ok, _event} = Events.create_event(%{start: start_event, end: end_event, title: title, allDay: false})
    {:noreply, push_event(socket, "calendar", %{render: "render"})}
  end
end
