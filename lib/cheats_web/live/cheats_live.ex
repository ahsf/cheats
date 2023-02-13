defmodule CheatsWeb.CheatsLive do
  use Phoenix.LiveView
  import CheatsWeb.Components

  def mount(_, _, socket) do
    dbg(socket.assigns)

    {
      :ok,
      assign(
        socket,
        n_childs: 10,
        container_css: [
          {"grid-template-rows", "1fr 1fr"},
          {"grid-template-columns", "1fr 1fr"},
          {"gap", "5px"},
          {"justify-items", "stretch"},
          {"align-items", "stretch"},
          {"justify-content", "start"},
          {"align-content", "start"}
        ]
      )
    }
  end

  def handle_event("container-changed", %{"container" => container_css}, socket) do
    socket |> assign(:container_css, container_css) |> noreply
  end

  defp noreply(socket), do: {:noreply, socket}
end
