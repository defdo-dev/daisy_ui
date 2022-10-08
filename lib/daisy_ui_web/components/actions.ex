if Code.ensure_loaded?(Phoenix.LiveView) do
  defmodule DaisyUiWeb.Components.Actions do
    @moduledoc """
    It give us the same menu

    We don't implement the modal because liveview provides one and daisy modal requires special treatment since it doesn't use javascript.
    """
    use Phoenix.Component
    import DaisyUi, only: [clean: 2]

    attr :pretty, :boolean, default: true
    attr :active, :boolean, default: false
    attr :type, :any, default: nil
    attr :class, :string,
      default: "",
      doc: """
      The default class is `btn`, you should add a modifier from the following table:

      | Class name     | Type       | Details                                |
      |----------------|------------|----------------------------------------|
      | `btn-primary`  | Modifier   | Button with `primary` color            |
      | `btn-secondary`| Modifier   | Button with `secondary` color          |
      | `btn-accent`   | Modifier   | Button with `accent` color             |
      | `btn-info`     | Modifier   | Button with `info` color               |
      | `btn-success`  | Modifier   | Button with `success` color            |
      | `btn-warning`  | Modifier   | Button with `warning` color            |
      | `btn-error`    | Modifier   | Button with `error` color              |
      | `btn-ghost`    | Modifier   | Button with ghost style                |
      | `btn-link`     | Modifier   | Button styled as a link                |
      | `btn-outline`  | Modifier   | Transparent Button with colored border |
      | `btn-active`   | Modifier   | Force button to show active state      |
      | `btn-disabled` | Modifier   | Force button to show disabled state    |
      | `glass`        | Modifier   | Button with a glass effect             |
      | `loading`      | Modifier   | Shows loading spinner                  |
      | `no-animation` | Modifier   | Disables click animation               |
      | `btn-lg`       | Responsive | Large button                           |
      | `btn-md`       | Responsive | Medium button (default)                |
      | `btn-sm`       | Responsive | Small button                           |
      | `btn-xs`       | Responsive | Extra small button                     |
      | `btn-wide`     | Responsive | Wide button (more horizontal padding)  |
      | `btn-block`    | Responsive | Full width button                      |
      | `btn-circle`   | Responsive | Circle button with a 1:1 ratio         |
      | `btn-square`   | Responsive | Square button with a 1:1 ratio         |
      """

    def button(assigns) do
      attrs = assigns
      |> assigns_to_attributes()
      |> clean([:pretty])

      type = if assigns[:type] do
        [type: assigns[:type]]
      else
        []
      end

      ~H"""
      <button {type} class={"#{if @pretty, do: "btn "}#{if @active, do: "btn-active "}#{@class}"} {attrs}>
        <%= render_slot(@inner_block) %>
      </button>
      """
    end

    attr :label, :any, default: []
    attr :content, :any, default: []
    attr :type, :string, default: "menu"

    attr :class, :string,
      default: "",
      doc: """
      There are two types of dropdown `menu` and `card`, the default is `menu`.

      | Class name       | Type     | Details            |
      |------------------|----------|--------------------|
      | `dropdown-end`   | Modifier | Aligns to end      |
      | `dropdown-top`   | Modifier | Open from top      |
      | `dropdown-left`  | Modifier | Open from left     |
      | `dropdown-right` | Modifier | Open from right    |
      | `dropdown-hover` | Modifier | Opens on hover too |
      | `dropdown-open`  | Modifier | Force open         |
      """

    attr :class_items, :string, default: "p-2 shadow bg-base-100 rounded-box w-52"

    def dropdown(assigns) do
      ~H"""
      <div class={"dropdown #{@class}"}>
        <label tabindex="0" class="m-1 btn"><%= render_slot(@label) %></label>
        <ul tabindex="0" class={"dropdown-content #{@type} #{@class_items}"}>
          <%= render_slot(@content) %>
        </ul>
      </div>
      """
    end

    attr :class, :string, default: ""

    def swap(assigns) do
      ~H"""
      <label class={"swap #{@class}"}>
        <input type="checkbox" />
        <%= render_slot(@on_block) %>
        <%= render_slot(@off_block) %>
      </label>
      """
    end

    def swap_on(assigns) do
      ~H"""
      <div class="swap-on"><%= render_slot(@inner_block) %></div>
      """
    end

    def swap_off(assigns) do
      ~H"""
      <div class="swap-off"><%= render_slot(@inner_block) %></div>
      """
    end
  end
end
