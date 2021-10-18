defmodule ComponentThree do
  use Phoenix.LiveComponent

  # mount invoked first, to include socket, mount optional on LiveComponent

  def update(_assigns, socket) do
    # update invoked after mount, to include assigns and socket
    {:ok, assign(socket, :title, Ecto.UUID.generate())}
  end

  def render(assigns) do
    ~H"""
    <div id="three">
      <p id="three-hook" phx-hook="Three" data-title={@title}>The title will appear here</p>
      <button type="button" phx-click="change_title" phx-target={@myself}>Change title</button>
    </div>
    """
  end

  def handle_event("change_title", _params, socket) do
    {:noreply, assign(socket, :title, Ecto.UUID.generate())}
  end
end
