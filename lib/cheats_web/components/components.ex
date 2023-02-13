defmodule CheatsWeb.Components do
  use Phoenix.Component
  import CheatsWeb.CoreComponents

  def grid_container_form(assigns) do
    ~H"""
    <.simple_form :let={f} for={:container} phx-change="container-changed">
      <div class="grid grid-cols-2 grid-flow-row justify-start">
        <%= for {property, value} <- @container_css do %>
          <.input field={{f, property}} value={value} label={property} />
        <% end %>
      </div>
    </.simple_form>
    """
  end

  def grid_container(assigns) do
    ~H"""
    <div class="grid w-full h-full" style={render_css(@container_css)}>
      <%= render_slot(@inner_block) %>
    </div>
    """
  end

  defp render_css(css_map) do
    for {property, value} <- css_map do
      "#{property}: #{value};"
    end
  end
end
