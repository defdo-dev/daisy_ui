if Code.ensure_loaded?(Phoenix.LiveView) do
  defmodule DaisyUiWeb.Components.Mockup do
    @moduledoc """
    Mockup components
    """
    use Phoenix.Component
    alias DaisyUiWeb.Components.Layout

    attr :class, :string,
      default: "",
      doc: """
      Defines a code mockup, complements with `line/1` to give an editor view.
      """

    slot :inner_block, required: true

    def code(assigns) do
      ~H"""
      <div class={"mockup-code #{@class}"}>
        <%= render_slot(@inner_block) %>
      </div>
      """
    end

    attr :content, :any, required: true
    attr :decorator, :string, default: ""

    attr :class, :string,
      default: "",
      doc: """
      Defines a code mockup, complements with `line/1` to give an editor view.
      """

    def line(assigns) do
      ~H"""
      <pre data-prefix={@decorator} class={@class}><code><%= @content %></code></pre>
      """
    end

    attr :orientation, :atom,
      default: :vertical,
      doc: """
      The :orientation should be `:horizontal` or `:vertical`.
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

    attr :class_content, :string,
      default: "",
      doc: """
      The `:class_content` overrides the screen styles.
      """

    attr :class, :string,
      default: "",
      doc: """
      Defines a mobile phone

      Hint: You should override the border to keep a focus style
      add `border-primary` to discover it.
      """

    slot :inner_block, required: true

    def mobile(assigns) do
      ~H"""
      <div class={"mockup-phone #{@class}"}>
        <div class="camera"></div>
        <div class="display">
          <Layout.artboard orientation={@orientation} phone_type={@phone_type} class={@class_content}>
            <%= render_slot(@inner_block) %>
          </Layout.artboard>
        </div>
      </div>
      """
    end

    attr :class, :string, default: "relative w-full h-full"
    slot :inner_block, required: true

    def screen(assigns) do
      ~H"""
      <section class={@class}>
        <%= render_slot(@inner_block) %>
      </section>
      """
    end

    attr :brand_name, :string, default: "defdo"
    attr :class, :string, default: ""

    attr :class_notch_brand, :string,
      default: "",
      doc: """
      Override the notch
      """

    attr :content, :any,
      default: [],
      doc: """
      Navigation slot, to add your custom block at notch.
      """

    slot :inner_block, required: true

    def mobile_notch(assigns) do
      ~H"""
      <header class={@class}>
        <section class={"flex justify-between pl-4 py-2 text-xs #{@class_notch_brand}"}>
          <span><%= @brand_name %></span>
          <nav class="flex h-4 space-x-0.5 pr-6">
            <svg class="h-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512">
              <path
                fill="currentColor"
                d="M32 384c-17.67 0-32 14.3-32 31.1v64C0 497.7 14.33 512 31.1 512S64 497.7 64 480v-64.9c0-16.8-14.33-31.1-32-31.1zm128-96c-17.7 0-32 14.3-32 31.1v160c0 18.6 14.3 32.9 32 32.9s32-14.33 32-31.1V319.1c0-16.8-14.3-31.1-32-31.1zM416 96c-17.67 0-32 14.33-32 31.1V480c0 17.7 14.3 32 32 32s32-14.33 32-31.1V127.1c0-16.8-14.3-31.1-32-31.1zm-128 96c-17.7 0-32 14.3-32 31.1v256c0 18.6 14.3 32.9 32 32.9s32-14.33 32-31.1V223.1c0-16.8-14.3-31.1-32-31.1z"
              />
            </svg>
            <svg
              class="hidden xs:block h-4 m-[0.18rem]"
              xmlns="http://www.w3.org/2000/svg"
              viewBox="0 0 576 512"
            >
              <path fill="currentColor" d="M96 192h352v128H96V192z" />
              <path
                fill="currentColor"
                d="M464 96c44.2 0 80 35.8 80 80v16c17.7 0 32 14.3 32 32v64c0 17.7-14.3 32-32 32v16c0 44.2-35.8 80-80 80H80c-44.18 0-80-35.8-80-80V176c0-44.2 35.82-80 80-80h384zM64 336c0 8.8 7.16 16 16 16h384c8.8 0 16-7.2 16-16V176c0-8.8-7.2-16-16-16H80c-8.84 0-16 7.2-16 16v160z"
                style="opacity:.4"
              />
            </svg>
          </nav>
        </section>

        <%= render_slot(@inner_block) %>
      </header>
      """
    end

    attr :class, :string,
      doc: """
      Allow to customize the window container
      """

    slot :inner_block, required: true

    def window(assigns) do
      ~H"""
      <section class={"mockup-window #{@class}"}>
        <%= render_slot(@inner_block) %>
      </section>
      """
    end
  end
end
