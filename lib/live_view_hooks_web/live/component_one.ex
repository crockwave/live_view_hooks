defmodule ComponentOne do
  use Phoenix.LiveComponent

  # mount invoked first, to include socket, mount optional on LiveComponent
  
  def update(_assigns, socket) do
    # update invoked after mount, to include assigns and socket
    # Push an event to the "one" hook
    {:ok, push_event(socket, "one", %{title: Ecto.UUID.generate()})}
  end

  def render(assigns) do
    # HMTL element id tag required for Hooks operation
    ~H"""
    <b><p id="one" phx-hook="One">The new title will appear here</p></b>
    """
  end
end
