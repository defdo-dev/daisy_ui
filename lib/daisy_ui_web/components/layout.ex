if Code.ensure_loaded?(Phoenix.LiveView) do
  defmodule DaisyUiWeb.Components.Layout do
    @moduledoc """
    Layout components
    """
    use Phoenix.Component

    alias DaisyUiWeb.Components.DataDisplay
    import String, only: [trim: 1]

    attr :orientation, :atom,
      default: :vertical,
      doc: """
      The `:orientation` should be `:horizontal` or `:vertical`.
      """

    attr :phone_type, :string,
      default: "phone-1",
      doc: """
      The :phone_type should be one of described below.

      | Class name | Type     | Details           |
      |------------|----------|-------------------|
      | `phone-1`  | Modifier | Size 1 (320×568)  |
      | `phone-2`  | Modifier | Size 2 (375×667)  |
      | `phone-3`  | Modifier | Size 3 (414×736)  |
      | `phone-4`  | Modifier | Size 4 (375×812)  |
      | `phone-5`  | Modifier | Size 5 (414×896)  |
      | `phone-6`  | Modifier | Size 6 (320×1024) |
      """

    attr :class, :string,
      default: "",
      doc: """
      Add extra classes
      """
    slot :inner_block, required: true

    def artboard(assigns) do
      orientation =
        case assigns.orientation do
          :horizontal -> "artboard-horizontal"
          :vertical -> "artboard-demo"
        end
      assigns = Map.put(assigns, :orientation, orientation)

      ~H"""
      <section class={"artboard #{@orientation} #{@phone_type} #{@class}"}>
        <%= render_slot(@inner_block) %>
      </section>
      """
    end

    attr :orientation, :atom,
      default: :horizontal,
      doc: """
      The :orientation should be `:horizontal` or `:vertical`. other values always be `vertical`.
      """

    attr :class, :string,
      default: "",
      doc: """
      Add extra classes
      """
    slot :inner_block, required: true

    def button_group(assigns) do
      ~H"""
      <div class={"btn-group #{if @orientation == :vertical, do: "btn-group-vertical"} #{@class}"}>
        <%= render_slot(@inner_block) %>
      </div>
      """
    end

    attr :orientation, :atom,
      default: :vertical,
      doc: """
      The :orientation should be `:horizontal` or `:vertical`. other values always be `vertical`.
      """

    attr :class, :string,
      default: "",
      doc: """
      Add extra classes
      """
    slot :inner_block, required: true

    def divider(assigns) do
      ~H"""
      <div class={"divider #{if @orientation == :horizontal, do: "divider-horizontal"} #{@class}"}>
        <%= render_slot(@inner_block) %>
      </div>
      """
    end

    attr :position, :atom,
      default: :left,
      doc: """
      Set the position of the drawer it could be `:left` or `:right`.
      """

    attr :class, :string,
      default: "",
      doc: """
      You can change keep the drawer open when is desktop, and closed on mobile.

      to do that you must add the class `drawer-mobile`.
      """

    attr :class_content, :string,
      default: "",
      doc: """
      Allows to add classes to improve the drawer-content wrapper.
      """

    attr :style_content, :string,
      default: nil
    attr :drawer_id, :string

    slot :drawer_content, required: true
    slot :drawer_sidebar, required: true
    def drawer(assigns) do

      styles = if assigns[:style_content] do
        [style: assigns[:style_content]]
      else
        []
      end
      assigns = Map.put(assigns, :styles, styles)

      ~H"""
      <section class={trim("drawer #{if @position == :right, do: "drawer-end "}#{@class}")}>
        <input id={@drawer_id} type="checkbox" class="drawer-toggle" />
        <div class={trim("drawer-content #{@class_content}")} {@styles}>
          <%= render_slot(@drawer_content) %>
        </div>
        <div class="drawer-side" {@styles}>
          <label for={@drawer_id} class="drawer-overlay"></label>
          <%= render_slot(@drawer_sidebar) %>
        </div>
      </section>
      """
    end

    attr :align, :atom,
      default: nil,
      doc: """
      The align atom only supports `:center` to align the content
      """

    attr :class, :string,
      default: "bg-neutral text-neutral-content",
      doc: """
      """

    slot :inner_block, required: true

    def footer(assigns) do
      ~H"""
      <footer class={"footer p-10 #{if @align == :center, do: " footer-center "}#{@class}"}>
        <%= render_slot(@inner_block) %>
      </footer>
      """
    end

    def footer_title(assigns) do
      ~H"""
      <span class="footer-title">
        <%= render_slot(@inner_block) %>
      </span>
      """
    end

    attr :class, :string, default: ""
    attr :bg_url, :string, default: nil
    slot :inner_block, required: true

    def hero(assigns) do
      assigns = assign_new(assigns, :with_background, fn ->
        if src = Map.get(assigns, :bg_url) do
          [style: "background-image: url(#{src})"]
        else
          []
        end
      end)

      ~H"""
      <div class={"hero #{@class}"} {@with_background}>
        <%= render_slot(@inner_block) %>
      </div>
      """
    end

    attr :class, :string, default: ""

    def hero_overlay(assigns) do
      ~H"""
      <div class={"hero-overlay #{@class}"}></div>
      """
    end

    attr :class, :string, default: ""
    slot :inner_block, required: true

    def hero_content(assigns) do
      ~H"""
      <div class={"hero-content #{@class}"}>
        <%= render_slot(@inner_block) %>
      </div>
      """
    end

    attr :label, :string, default: nil

    attr :place_x, :atom,
      default: :end,
      doc: """
      Options:
        `:start`
        `:center`
        `:end`
      """

    attr :place_y, :atom,
      default: :bottom,
      doc: """
      Options:
        `:top`
        `:middle`
        `:bottom`
      """

    attr :class, :string,
      default: "badge-accent",
      doc: """
      The indicator renders a badge so keep that in mind if you want to change
      pass the appropriated badge classes to change the color
      """
    slot :inner_block, required: true

    def indicator(assigns) do
      place_x =
        case assigns.place_x do
          :start -> "toast-start"
          :center -> "toast-center"
          :end -> "toast-end"
        end

      place_y =
        case assigns.place_y do
          :top -> "toast-top"
          :middle -> "toast-middle"
          :bottom -> "toast-bottom"
        end
      assigns = assigns
        |> Map.put(:place_x, place_x)
        |> Map.put(:place_y, place_y)

      ~H"""
      <div class="indicator">
        <DataDisplay.badge class={"indicator-item #{@place_x} #{@place_y} #{@class}"}>
          <%= @label %>
        </DataDisplay.badge>
        <%= render_slot(@inner_block) %>
      </div>
      """
    end

    attr :size, :atom,
      default: nil,
      doc: """
      Given the following sizes the group will affected

      | Size        | Type     | Details                                       |
      |-------------|----------|-----------------------------------------------|
      | `lg`        | Modifier | Large size for input-group wrapper            |
      | `md`        | Modifier | Medium (default) size for input-group wrapper |
      | `sm`        | Modifier | Small size for input-group wrapper            |
      | `xs`        | Modifier | Extra small size for input-group wrapper      |
      """

    attr :orientation, :atom,
      default: :horizontal,
      doc: """
      The :orientation should be `:horizontal` or `:vertical`. other values always be `horizontal`.

      | Orientation | Type     | Details                                  |
      |-------------|----------|------------------------------------------|
      | `vertical`  | Modifier | Vertical direction for input-group items |
      """

    attr :class, :string,
      default: "",
      doc: """
      Customize the input group, given the following classes.
      """
    slot :inner_block, required: true

    def input_group(assigns) do
      size =
        case Map.get(assigns, :size) do
          nil -> ""
          :xs -> "input-group-xs"
          :sm -> "input-group-sm"
          :md -> "input-group-md"
          :lg -> "input-group-lg"
        end
      assigns = Map.put(assigns, :size, size)

      ~H"""
      <label class={"input-group #{@size} #{if @orientation == :vertical, do: "input-group-vertical"} #{if @orientation == :vertical, do: "input-group-vertical"} #{@class}"}>
        <%= render_slot(@inner_block) %>
      </label>
      """
    end

    attr :src, :string, required: true
    attr :alt, :string, default: ""

    attr :type, :string,
      default: nil,
      doc: """
      The following types are available to change the mask

      | Type name         | Type     | Details                                   |
      |-------------------|----------|-------------------------------------------|
      | `squircle`        | Modifier | Applies `squircle` shape                  |
      | `heart`           | Modifier | Applies `heart` shape                     |
      | `hexagon`         | Modifier | Applies `hexagon` shape                   |
      | `hexagon-2`       | Modifier | Applies `hexagon` alternative shape       |
      | `decagon`         | Modifier | Applies `decagon` shape                   |
      | `pentagon`        | Modifier | Applies `pentagon` shape                  |
      | `diamond`         | Modifier | Applies `diamond` shape                   |
      | `square`          | Modifier | Applies `square` shape                    |
      | `circle`          | Modifier | Applies `circle` shape                    |
      | `parallelogram`   | Modifier | Applies `parallelogram` shape             |
      | `parallelogram-2` | Modifier | Applies `parallelogram` alternative shape |
      | `parallelogram-3` | Modifier | Applies `parallelogram` alternative shape |
      | `parallelogram-4` | Modifier | Applies `parallelogram` alternative shape |
      | `star`            | Modifier | Applies `star` shape                      |
      | `star-2`          | Modifier | Applies `star` alternative shape          |
      | `triangle`        | Modifier | Applies `triangle` shape                  |
      | `triangle-2`      | Modifier | Applies `triangle` alternative shape      |
      | `triangle-3`      | Modifier | Applies `triangle` alternative shape      |
      | `triangle-4`      | Modifier | Applies `triangle` alternative shape      |
      | `half-1`          | Modifier | Crops only the first half of mask         |
      | `half-2`          | Modifier | Crops only the second half of mask        |
      """

    attr :class, :string, default: ""

    def mask(assigns) do
      ~H"""
      <img class={"mask #{if mask_valid?(@type), do: "mask-#{@type}"} #{@class}"} src={@src} alt={@alt} />
      """
    end

    attr :class, :string, default: ""
    slot :inner_block, required: true
    @spec stack(assigns :: map) :: Phoenix.LiveView.Rendered.t()
    def stack(assigns) do
      ~H"""
      <div class={"stack #{@class}"}>
        <%= render_slot(@inner_block) %>
      </div>
      """
    end

    attr :place_x, :atom,
      default: :end,
      doc: """
      Options:
        `:start`
        `:center`
        `:end`
      """

    attr :place_y, :atom,
      default: :bottom,
      doc: """
      Options:
        `:top`
        `:middle`
        `:bottom`
      """

    attr :class, :string, default: ""
    slot :inner_block, required: true

    def toast(assigns) do
      place_x =
        case assigns.place_x do
          :start -> "toast-start"
          :center -> "toast-center"
          :end -> "toast-end"
        end

      place_y =
        case assigns.place_y do
          :top -> "toast-top"
          :middle -> "toast-middle"
          :bottom -> "toast-bottom"
        end

      assigns = assigns
      |> Map.put(:place_x, place_x)
      |> Map.put(:place_y, place_y)

      ~H"""
      <div class={"toast #{@place_x} #{@place_y} #{@class}"}>
        <%= render_slot(@inner_block) %>
      </div>
      """
    end

    defp mask_valid?(type) do
      "#{type}" in ~w(squircle heart hexagon hexagon-2 decagon pentagon diamond square circle parallelogram parallelogram-2 parallelogram-3 parallelogram-4 star star-2 triangle triangle-2 triangle-3 triangle-4 half-1 half-2)
    end
  end
end
