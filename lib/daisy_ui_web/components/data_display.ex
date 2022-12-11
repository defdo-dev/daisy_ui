if Code.ensure_loaded?(Phoenix.LiveView) do
  defmodule DaisyUiWeb.Components.DataDisplay do
    @moduledoc """
    Data Display Components
    """
    use Phoenix.Component
    import DaisyUiWeb.Gettext

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

    slot :navigate, required: false
    slot :inner_block, required: true

    def alert(assigns) do
      ~H"""
      <div class={"alert #{@class}"}>
        <div>
          <%= render_slot(@inner_block) %>
        </div>
        <div :if={@navigate} class="flex-none">
          <%= render_slot(@navigate) %>
        </div>
      </div>
      """
    end

    attr :class, :string, default: ""
    slot :inner_block, required: true

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

    slot :inner_block, required: false

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

    slot :inner_block, required: true

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
      <figure><img src={@src} alt={@alt} class={@class} /></figure>
      """
    end

    attr :class, :string,
      default: "",
      doc: """
      Component to render a block body for a card component.
      """

    slot :inner_block, required: true

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

    slot :inner_block, required: false

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

    slot :inner_block, required: true

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

    slot :inner_block, required: true

    def card_actions(assigns) do
      ~H"""
      <nav class={"card-actions #{@class}"}>
        <%= render_slot(@inner_block) %>
      </nav>
      """
    end

    attr :class, :string, default: "w-full"
    slot :inner_block, required: true

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
    slot :inner_block, required: false

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

    slot :inner_block, required: true

    def collapse(assigns) do
      assigns =
        assigns
        |> assign_new(:with_focus, fn ->
          if assigns.with_focus do
            [tabindex: "0"]
          end
        end)

      ~H"""
      <div {@with_focus} class={"collapse #{@class}"}>
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

    slot :inner_block, required: true

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

    slot :inner_block, required: true

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

    slot :inner_block, required: false

    @spec radial_progress(map) :: Phoenix.LiveView.Rendered.t()
    def radial_progress(assigns) do
      ~H"""
      <div
        class={"radial-progress #{@class}"}
        style={"--value:#{@value}; #{if @size, do: "--size: #{@size};"} #{if @thickness, do: "--thickness: #{@thickness};"}"}
      >
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

    slot :inner_block, required: true

    def stats(assigns) do
      ~H"""
      <div class={"stats #{if @orientation == :vertical, do: "stats-vertical"} #{@class}"}>
        <%= render_slot(@inner_block) %>
      </div>
      """
    end

    attr :class, :string, default: ""
    attr :figure, :any, default: []
    slot :inner_block, required: true

    def stat(assigns) do
      ~H"""
      <div class={"stat #{@class}"}>
        <%= render_slot(@inner_block) %>
      </div>
      """
    end

    attr :class, :string, default: ""
    slot :inner_block, required: true

    def stat_figure(assigns) do
      ~H"""
      <div class={"stat-figure #{@class}"}>
        <%= render_slot(@inner_block) %>
      </div>
      """
    end

    attr :class, :string, default: ""
    slot :inner_block, required: true

    def stat_title(assigns) do
      ~H"""
      <div class={"stat-title #{@class}"}>
        <%= render_slot(@inner_block) %>
      </div>
      """
    end

    attr :class, :string, default: ""
    slot :inner_block, required: true

    def stat_value(assigns) do
      ~H"""
      <div class={"stat-value #{@class}"}>
        <%= render_slot(@inner_block) %>
      </div>
      """
    end

    attr :class, :string, default: ""
    slot :inner_block, required: true

    def stat_desc(assigns) do
      ~H"""
      <div class={"stat-desc #{@class}"}>
        <%= render_slot(@inner_block) %>
      </div>
      """
    end

    @doc ~S"""
    Renders a table with generic styling.

    ## Examples

        <.table id="users" rows={@users}>
          <:col :let={user} label="id"><%= user.id %></:col>
          <:col :let={user} label="username"><%= user.username %></:col>
        </.table>
    """
    attr :id, :string, required: true
    attr :row_click, :any, default: nil
    attr :rows, :list, required: true
    attr :modifier, :string, default: "", values: ["", "zebra"]
    attr :responsive, :string, default: "normal", values: ["normal", "compact"]
    attr :status_modifier, :string, default: "", values: ["", "active", "hover"]
    attr :class, :string, default: ""

    slot :col, required: true do
      attr :label, :string
    end

    slot :action, doc: "the slot for showing user actions in the last table column"

    def table(assigns) do
      ~H"""
      <div id={@id} class="overflow-y-auto px-4 sm:overflow-visible sm:px-0">
        <table class={"table #{table_modifier(@modifier)} #{table_responsive(@responsive)} #{@class}"}>
          <thead class="text-[0.8125rem]">
            <tr>
              <th :for={col <- @col}><%= col[:label] %></th>
              <th><span class="sr-only"><%= gettext("Actions") %></span></th>
            </tr>
          </thead>
          <tbody class="text-sm">
            <tr :for={row <- @rows} id={"#{@id}-#{row_id(row)}"} class={"#{@status_modifier}"}>
              <td
                :for={{col, i} <- Enum.with_index(@col)}
                phx-click={@row_click && @row_click.(row)}
                class={["", @row_click && "hover:cursor-pointer"]}
              >
                <div :if={i == 0}>
                  <span class="absolute h-full w-4 top-0 -left-4 sm:rounded-l-xl" />
                  <span class="absolute h-full w-4 top-0 -right-4 sm:rounded-r-xl" />
                </div>
                <div class="block">
                  <span class={["relative", i == 0 && "font-semibold"]}>
                    <%= render_slot(col, row) %>
                  </span>
                </div>
              </td>
              <td :if={@action != []}>
                <div class="relative whitespace-nowrap text-center text-sm font-medium">
                  <span :for={action <- @action} class="relative font-semibold">
                    <%= render_slot(action, row) %>
                  </span>
                </div>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
      """
    end

    defp row_id(row) when is_map(row) do
      cond do
        is_map_key(row, "id") ->
          Map.get(row, "id")

        is_map_key(row, :id) ->
          Map.get(row, :id)

        true ->
          Enum.random(1..999_999)
      end
    end

    defp table_modifier("zebra"), do: "table-zebra"
    defp table_modifier(_), do: ""
    defp table_responsive("compact"), do: "table-compact"
    defp table_responsive(_), do: "table-normal"

    attr :open, :boolean, default: false
    attr :tip, :string, default: ""

    attr :class, :string,
      default: nil,
      doc: """
      Available modifiers:

      | Class name        | Type     | Details                           |
      |-------------------|----------|-----------------------------------|
      | tooltip-top       | Modifier | Put tooltip on top                |
      | tooltip-bottom    | Modifier | Put tooltip on bottom             |
      | tooltip-left      | Modifier | Put tooltip on left               |
      | tooltip-right     | Modifier | Put tooltip on right              |
      | tooltip-primary   | Modifier | Adds `primary` color to tooltip   |
      | tooltip-secondary | Modifier | Adds `secondary` color to tooltip |
      | tooltip-accent    | Modifier | Adds `accent` color to tooltip    |
      | tooltip-info      | Modifier | Adds `info` color to tooltip      |
      | tooltip-success   | Modifier | Adds `success` color to tooltip   |
      | tooltip-warning   | Modifier | Adds `warning` color to tooltip   |
      | tooltip-error     | Modifier | Adds `error` color to tooltip     |
      """

    slot :inner_block, required: true

    def tooltip(assigns) do
      ~H"""
      <div class={"tooltip #{@class} #{if @open, do: "tooltip-open"}"} data-tip={@tip}>
        <%= render_slot(@inner_block) %>
      </div>
      """
    end
  end
end
