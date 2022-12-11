if Code.ensure_loaded?(Phoenix.LiveView) do
  defmodule DaisyUiWeb.Components.Navigation do
    @moduledoc """
    Navigation Component
    """
    use Phoenix.Component

    attr :entries, :list,
      required: true,
      doc: """
      The entries must be a list

      We enrich the list to allow you determine if the item is first or last in order to customize your output

      the let={entry} contains a map with is_first, is_last, content keys.

      is_first is true for the first entry
      is_last is true for the last entry
      content is the entry from the list
      """

    attr :class, :string,
      default: "",
      doc: """
      Change the container styles
      """

    slot :inner_block, required: true

    def breadcrumbs(assigns) do
      ~H"""
      <div class={"breadcrumbs text-sm #{@class}"}>
        <%= if @entries != [] do %>
          <ul>
            <%= for entry <- enrich_breadcrumbs(@entries) do %>
              <li><%= render_slot(@inner_block, entry) %></li>
            <% end %>
          </ul>
        <% end %>
      </div>
      """
    end

    attr :class, :string,
      default: "",
      doc: """
      Change the container styles
      """

    slot :inner_block, required: true

    def bottom_navigation(assigns) do
      ~H"""
      <div class={"btm-nav #{@class}"}>
        <%= render_slot(@inner_block) %>
      </div>
      """
    end

    attr :action, :atom,
      default: :normal,
      doc: """
      The action give us the ability to render the right link

      :normal renders a link util to default behaviour
      :navigate renders a link for navigate between liveview pages (remount)
      :patch renders a link for navigate in the same liveview page (no remount)
      """

    attr :to, :string, required: false

    attr :target, :string,
      default: "_self",
      doc: """
      The following options are available:

      | Value     | Description                                                                     |
      |-----------|---------------------------------------------------------------------------------|
      | _blank    | Opens the linked document in a new window or tab                                |
      | _self     | Opens the linked document in the same frame as it was clicked (this is default) |
      | _parent   | Opens the linked document in the parent frame                                   |
      | _top      | Opens the linked document in the full body of the window                        |
      | framename | Opens the linked document in the named iframe                                   |
      """

    attr :entries, :list, required: true

    attr :class, :string,
      default: "",
      doc: """
      Change the container styles
      """

    slot :inner_block, required: true

    def menu(assigns) do
      ~H"""
      <ul class={"menu #{@class}"}>
        <%= if @entries != [] do %>
          <%= for entry <- @entries do %>
            <%= render_slot(@inner_block, entry) %>
          <% end %>
        <% end %>
      </ul>
      """
    end

    attr :class, :string,
      default: "",
      doc: """
      Change the container styles
      """

    slot :inner_block, required: true

    def menu_item(assigns) do
      ~H"""
      <li class={@class}><%= render_slot(@inner_block) %></li>
      """
    end

    attr :class, :string,
      default: "",
      doc: """
      Change the container styles
      """

    slot :inner_block, required: true

    def navbar(assigns) do
      ~H"""
      <section class={"navbar #{@class}"}>
        <%= render_slot(@inner_block) %>
      </section>
      """
    end

    attr :class, :string,
      default: "",
      doc: """
      Change the container styles
      """

    slot :inner_block, required: true

    def pagination(assigns) do
      ~H"""
      <nav class={"btn-group #{@class}"}><%= render_slot(@inner_block) %></nav>
      """
    end

    attr :orientation, :atom,
      default: :horizontal,
      doc: """
      The :orientation should be `:horizontal` or `:vertical`.

      | Orientation | Type     | Details                                  |
      |-------------|----------|------------------------------------------|
      | `vertical`  | Modifier | Vertical direction for input-group items |
      """

    attr :entries, :list, required: true

    attr :class, :string,
      default: "",
      doc: """
      Change the container styles
      """

    slot :inner_block, required: true

    def steps(assigns) do
      ~H"""
      <ul class={"steps #{if @orientation == :vertical, do: "steps-vertical "}#{@class}"}>
        <%= if @entries != [] do %>
          <%= for entry <- @entries do %>
            <%= render_slot(@inner_block, entry) %>
          <% end %>
        <% end %>
      </ul>
      """
    end

    attr :class, :string,
      default: "",
      doc: """
      Change the container styles
      """

    slot :inner_block, required: true

    def step(assigns) do
      ~H"""
      <li class={"step #{@class}"}><%= render_slot(@inner_block) %></li>
      """
    end

    attr :entries, :list, default: []

    attr :class, :string,
      default: "",
      doc: """
      Change the container styles
      """

    slot :inner_block, required: true

    def tabs(assigns) do
      ~H"""
      <section class={"tabs #{@class}"}>
        <%= if @entries != [] do %>
          <%= for entry <- @entries do %>
            <%= render_slot(@inner_block, entry) %>
          <% end %>
        <% else %>
          <%= render_slot(@inner_block) %>
        <% end %>
      </section>
      """
    end

    attr :to, :string,
      doc: """
      Patches the current LiveView.
      The `handle_params` callback of the current LiveView will be invoked and the minimum content
      will be sent over the wire, as any other LiveView diff.
      """

    attr :class, :string,
      default: "",
      doc: """
      Change the container styles
      """

    slot :inner_block, required: true

    def tab(assigns) do
      ~H"""
      <.link class={"tab #{@class}"} patch={@to}><%= render_slot(@inner_block) %></.link>
      """
    end

    defp enrich_breadcrumbs(entries) when is_list(entries) do
      [first | rest] = entries
      [last | rest] = Enum.reverse(rest)
      middle = Enum.reverse(rest)

      [entry({:first, first})] ++
        Enum.map(middle, &entry({:middle, &1})) ++ [entry({:last, last})]
    end

    defp entry({:first, content}) do
      %{is_first: true, is_last: false, content: content}
    end

    defp entry({:last, content}) do
      %{is_first: false, is_last: true, content: content}
    end

    defp entry({_, content}) do
      %{is_first: true, is_last: false, content: content}
    end
  end
end
