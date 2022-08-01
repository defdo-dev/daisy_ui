if Code.ensure_loaded?(Phoenix.LiveView) do
  defmodule DaisyUiWeb.Components.DataDisplay do
    @moduledoc """
    Data Display Components
    """
    use Phoenix.Component

    attr :navigate, :list, default: []

    attr :class, :string,
      default: "",
      doc: """
      The following classes are ready to be used within the alert component.

      | Class name    | Type       | Details                    |
      |---------------|------------|----------------------------|
      | alert-info    | Responsive | Alert with `info` color    |
      | alert-success | Responsive | Alert with `success` color |
      | alert-warning | Responsive | Alert with `warning` color |
      | alert-error   | Responsive | Alert with `error` color   |
      """

    def alert(assigns) do
      ~H"""
      <div class={"alert #{@class}"}>
        <div>
          <%= render_slot(@inner_block) %>
        </div>
        <%= if @navigate != [] do %>
          <div class="flex-none">
            <%= render_slot(@navigate) %>
          </div>
        <% end %>
      </div>
      """
    end

    attr :class, :string, default: ""

    def avatar(assigns) do
      ~H"""
      <div class="avatar">
        <div class={@class}>
          <%= render_slot(@inner_block) %>
        </div>
      </div>
      """
    end

    attr :text, :string, default: nil

    attr :class, :string,
      default: "",
      doc: """
      The following classes are ready to be used within the alert component.

      | Class name      | Type       | Details                                  |
      |-----------------|------------|------------------------------------------|
      | badge-outline   | Modifier   | transparent badge with [colorful] border |
      | badge-lg        | Responsive | badge with large size                    |
      | badge-md        | Responsive | badge with medium size (default)         |
      | badge-sm        | Responsive | badge with small size                    |
      | badge-xs        | Responsive | badge with extra small size              |
      | badge-primary   | Responsive | badge with `primary` color               |
      | badge-secondary | Responsive | badge with `secondary` color             |
      | badge-accent    | Responsive | badge with `accent` color                |
      | badge-ghost     | Responsive | badge with `ghost` color                 |
      | badge-info      | Responsive | badge with `info` color                  |
      | badge-success   | Responsive | badge with `success` color               |
      | badge-warning   | Responsive | badge with `warning` color               |
      | badge-error     | Responsive | badge with `error` color                 |
      """

    def badge(assigns) do
      ~H"""
      <span class={"badge #{@class}"}>
       <%= if @text do %>
        <%= @text %>
       <% else %>
        <%= render_slot(@inner_block) %>
       <% end %>
      </span>
      """
    end

    attr :text, :string, default: nil

    attr :class, :string,
      default: "",
      doc: """
      The following classes are ready to be used within the alert component.

      | Class name    | Type       | Details                                              |
      |---------------|------------|------------------------------------------------------|
      | card-bordered | Modifier   | Adds border to <card>                                |
      | image-full    | Modifier   | The image in <figure> element will be the background |
      | card-normal   | Responsive | Applies default paddings                             |
      | card-compact  | Responsive | Applies smaller padding                              |
      | card-side     | Responsive | The image in <figure> will be on the side            |
      """

    def card(assigns) do
      ~H"""
      <section class={"card #{@class}"}>
        <%= render_slot(@inner_block) %>
      </section>
      """
    end

    attr :src, :string, required: true
    attr :alt, :string, default: ""

    attr :class, :string,
      default: "",
      doc: """
      Component to render a image for a card component.
      """

    def card_image(assigns) do
      ~H"""
      <figure><img src={@src} alt={@alt} class={@class}></figure>
      """
    end

    attr :class, :string,
      default: "",
      doc: """
      Component to render a block body for a card component.
      """

    def card_body(assigns) do
      ~H"""
      <div class={"card-body #{@class}"}>
        <%= render_slot(@inner_block) %>
      </div>
      """
    end

    attr :text, :string, default: nil

    attr :class, :string,
      default: "",
      doc: """
      Component to render a block title for a card component.
      """

    def card_title(assigns) do
      ~H"""
      <h2 class={"card-title #{@class}"}>
        <%= if @text do %>
          <%= @text %>
        <% else %>
          <%= render_slot(@inner_block) %>
        <% end %>
      </h2>
      """
    end

    attr :class, :string,
      default: "",
      doc: """
      Component to render a block title for a card component.
      """

    def card_content(assigns) do
      ~H"""
      <%= render_slot(@inner_block) %>
      """
    end

    attr :class, :string,
      default: "justify-end",
      doc: """
      Component to render a block actions for a card component.
      """

    def card_actions(assigns) do
      ~H"""
      <nav class={"card-actions #{@class}"}>
        <%= render_slot(@inner_block) %>
      </nav>
      """
    end

    attr :class, :string, default: "w-full"

    def carousel(assigns) do
      ~H"""
      <div class={"carousel #{@class}"}>
        <%= render_slot(@inner_block) %>
      </div>
      """
    end

    attr :src, :string, default: nil
    attr :alt, :string, default: nil
    attr :image_class, :string, default: ""
    attr :class, :string, default: ""

    def carousel_item(assigns) do
      ~H"""
      <div class={"carousel-item #{@class}"}>
        <%= if @src do %>
          <img src={@src} class={@image_class} />
        <% else %>
          <%= render_slot(@inner_block) %>
        <% end %>
      </div>
      """
    end

    attr :with_focus, :boolean, default: false

    attr :class_checkbox, :string,
      default: "",
      doc: """
      Use Tailwind CSS `peer` and `peer-checked` utilities to apply style when sibling checkbox is checked
      """

    attr :class, :string,
      default: "",
      doc: """
      Component for collapse content is used for showing and hiding it.

      There are few modifiers to be used.

      | Size           | Type     | Details              |
      |----------------|----------|----------------------|
      | collapse-arrow | Modifier | Adds arrow icon      |
      | collapse-plus  | Modifier | Adds plus/minus icon |
      | collapse-open  | Modifier | Force open           |
      | collapse-close | Modifier | Force close          |

      Use Tailwind CSS `group` and `group-focus` utilities to apply style when parent div is focused
      """

    def collapse(assigns) do
      with_focus =
        if assigns.with_focus do
          [tabindex: "0"]
        end

      ~H"""
      <div {with_focus} class={"collapse #{@class}"}>
        <%= if not @with_focus do %>
          <input type="checkbox" class="" />
        <% end %>
        <%= render_slot(@inner_block) %>
      </div>
      """
    end

    attr :class, :string,
      default: "",
      doc: """
      If you apply the tailwind `group` to the `collapse` component, you should use
      the tailwind `group-focus` to customize the parent style.
      """

    def collapse_title(assigns) do
      ~H"""
      <div class={"collapse-title #{@class}"}>
        <%= render_slot(@inner_block) %>
      </div>
      """
    end

    attr :class, :string,
      default: "",
      doc: """
      If you apply the tailwind `group` to the `collapse` component, you should use
      the tailwind `group-focus` to customize the parent style.
      """

    def collapse_content(assigns) do
      ~H"""
      <div class={"collapse-content #{@class}"}>
        <%= render_slot(@inner_block) %>
      </div>
      """
    end

    def countdown(_assigns) do
      raise "not yet implemented"
    end

    attr :key, :string, required: true

    attr :class, :string,
      default: "",
      doc: """
      Component to render a key,

      | Class name | Type       | Details               |
      |------------|------------|-----------------------|
      | kbd-lg     | Responsive | Large size            |
      | kbd-md     | Responsive | Medium size (default) |
      | kbd-sm     | Responsive | Small size            |
      | kbd-xs     | Responsive | Extra small size      |
      """

    def kbd(assigns) do
      ~H"""
      <kbd class={"kbd #{@class}"}><%= @key %></kbd>
      """
    end

    attr :value, :integer, default: nil
    attr :max, :integer, default: nil

    attr :class, :string,
      default: "w-56",
      doc: """
      A progress component.

      When you pass a class be sure that the width must be added we use w-56 by default.

      | Class name         | Type     | Details                |
      |--------------------|----------|------------------------|
      | progress-primary   | Modifier | Adds `primary` color   |
      | progress-secondary | Modifier | Adds `secondary` color |
      | progress-accent    | Modifier | Adds `accent` color    |
      | progress-info      | Modifier | Adds `info` color      |
      | progress-success   | Modifier | Adds `success` color   |
      | progress-warning   | Modifier | Adds `warning` color   |
      | progress-error     | Modifier | Adds `error` color     |

      """

    def progress(assigns) do
      ~H"""
      <progress class={"progress #{@class}"} value={@value} max={@max}></progress>
      """
    end

    attr :value, :integer, default: 0
    attr :label, :string, default: nil

    attr :size, :string,
      default: nil,
      doc: """
      Modify the component size use rem o px
      """

    attr :thickness, :string,
      default: nil,
      doc: """
      Modify the component thickness use rem o px
      """

    attr :class, :string,
      default: "w-56",
      doc: """
      A radial progress component to render percentage from 0 to 100.

      use label to customize
      """

    @spec radial_progress(map) :: Phoenix.LiveView.Rendered.t()
    def radial_progress(assigns) do
      ~H"""
      <div class={"radial-progress #{@class}"} style={"--value:#{@value}; #{if @size, do: "--size: #{@size};"} #{if @thickness, do: "--thickness: #{@thickness};"}"}>
        <%= if @label do %>
          <%= @label %>
        <% else %>
          <%= if @inner_block do %>
            <%= render_slot(@inner_block) %>
          <% else %>
            <%= "#{@value}%" %>
          <% end %>
        <% end %>
      </div>
      """
    end

    attr :class, :string, default: ""

    attr :orientation, :atom,
      default: :horizontal,
      doc: """
      The available orientations

        `:horizontal` is the default orientation
        `:vertical`

      if you want to customize using responsive behaviour you must add the
      classes `stats-horizontal` or `stats-vertical` within the responsive prefix.
      """

    def stats(assigns) do
      ~H"""
      <div class={"stats #{if @orientation == :vertical, do: "stats-vertical"} #{@class}"}>
        <%= render_slot(@inner_block) %>
      </div>
      """
    end

    attr :class, :string, default: ""
    attr :figure, :any, default: []

    def stat(assigns) do
      ~H"""
      <div class={"stat #{@class}"}>
        <%= render_slot(@inner_block) %>
      </div>
      """
    end

    attr :class, :string, default: ""

    def stat_figure(assigns) do
      ~H"""
      <div class={"stat-figure #{@class}"}>
        <%= render_slot(@inner_block) %>
      </div>
      """
    end

    attr :class, :string, default: ""

    def stat_title(assigns) do
      ~H"""
      <div class={"stat-title #{@class}"}>
        <%= render_slot(@inner_block) %>
      </div>
      """
    end

    attr :class, :string, default: ""

    def stat_value(assigns) do
      ~H"""
      <div class={"stat-value #{@class}"}>
        <%= render_slot(@inner_block) %>
      </div>
      """
    end

    attr :class, :string, default: ""

    def stat_desc(assigns) do
      ~H"""
      <div class={"stat-desc #{@class}"}>
        <%= render_slot(@inner_block) %>
      </div>
      """
    end

    attr :class_container, :string,
      default: "overflow-x-auto",
      doc: """
      Overrides the container class
      """

    attr :class, :string,
      default: "w-full",
      doc: """
      Apply classes to the the table tag.
      """

    def table(assigns) do
      ~H"""
      <div class={@class_container}>
        <table class={"table #{@class}"}>
          <%= render_slot(@inner_block) %>
        </table>
      </div>
      """
    end

    attr :class, :string, default: ""

    def thead(assigns) do
      ~H"""
      <thead class={@class}>
        <%= render_slot(@inner_block) %>
      </thead>
      """
    end

    attr :class, :string, default: ""

    def tbody(assigns) do
      ~H"""
      <tbody class={@class}>
        <%= render_slot(@inner_block) %>
      </tbody>
      """
    end

    attr :class, :string, default: ""

    def tfoot(assigns) do
      ~H"""
      <tfoot class={@class}>
        <%= render_slot(@inner_block) %>
      </tfoot>
      """
    end

    attr :class, :string, default: ""

    def tr(assigns) do
      ~H"""
      <tr class={@class}>
        <%= render_slot(@inner_block) %>
      </tr>
      """
    end

    attr :class, :string, default: ""

    def th(assigns) do
      ~H"""
      <th class={@class}><%= render_slot(@inner_block) %></th>
      """
    end

    attr :class, :string, default: ""

    def td(assigns) do
      ~H"""
      <td class={@class}><%= render_slot(@inner_block) %></td>
      """
    end

    attr :position, :atom,
      default: :top,
      doc: """
      Available positions:

      `:top` (default)
      `:right`
      `:bottom`
      `:left`
      """

    attr :open, :boolean, default: false
    attr :tip, :string, default: ""
    attr :class, :string, default: ""

    def tooltip(assigns) do
      position =
        case assigns.position do
          :top -> "tooltip-top"
          :right -> "tooltip-right"
          :bottom -> "tooltip-bottom"
          :left -> "tooltip-left"
        end

      ~H"""
      <div class={"tooltip #{position} #{if @open, do: "tooltip-open"}"} data-tip={@tip}>
        <%= render_slot(@inner_block) %>
      </div>
      """
    end
  end
end
