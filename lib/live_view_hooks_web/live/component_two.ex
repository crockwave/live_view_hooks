defmodule ComponentTwo do
  use Phoenix.LiveComponent

  # mount invoked first, to include socket, mount optional on LiveComponent

  def update(_assigns, socket) do
    {:ok, assign(socket, :title, Ecto.UUID.generate())}
  end

  def render(assigns) do
    ~H"""
    <div id="two">
      <b><p id="two-hook" phx-hook="Two">The title will appear here</p></b>
      <button type="button" phx-click="change_title" phx-target={@myself}>Change title</button>
    </div>
    """
  end

  def handle_event("get_title", _params, socket) do
    # handle pushEventTo from Hook mount event
    {:noreply, push_event(socket, "two", %{title: socket.assigns.title})}
  end

  def handle_event("change_title", _params, socket) do
    # handle button click event
    socket = assign(socket, :title, Ecto.UUID.generate())
    {:noreply, push_event(socket, "two", %{title: socket.assigns.title})}
  end
end
