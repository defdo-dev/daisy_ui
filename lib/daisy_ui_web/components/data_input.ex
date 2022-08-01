if Code.ensure_loaded?(Phoenix.LiveView) do
  defmodule DaisyUiWeb.Components.DataInput do
    @moduledoc """
    Data Input Components
    """
    use Phoenix.HTML
    use Phoenix.Component

    attr :class, :string, default: "w-full max-w-xs"
    def form_control(assigns) do
      ~H"""
      <div class={"form-control #{@class}"}>
        <%= render_slot(@inner_block) %>
      </div>
      """
    end

    attr :class, :string, default: ""
    def label_control(assigns) do
      ~H"""
      <label class={"label #{@class}"}>
        <%= render_slot(@inner_block) %>
      </label>
      """
    end

    attr :class, :string, default: ""
    def label_text(assigns) do
      ~H"""
      <span class={"label-text #{@class}"}>
        <%= render_slot(@inner_block) %>
      </span>
      """
    end

    attr :class, :string, default: ""
    def label_text_alt(assigns) do
      ~H"""
      <span class={"label-text-alt #{@class}"}>
        <%= render_slot(@inner_block) %>
      </span>
      """
    end

    attr :form, :any, default: nil, doc: """
    Expect to be the context for the form
    """
    attr :field, :atom, default: nil, doc: """
    It must be provided when a context `:form` is passed it gives the ability
    to render correctly
    """
    attr :type, :string, default: "text"
    attr :class, :string, default: "", doc: """
    Customize the input using the following classes
    """
    def input(%{type: type} = assigns) when type in [:radio, "radio"] do
      ~H"""
      <%= if @form && @field do %>
        <%= input(@form, @field, assigns) %>
      <% else %>
        <.radio {assigns} />
      <% end %>
      """
    end

    def input(%{type: type} = assigns) when type in [:checkbox, "checkbox"] do
      ~H"""
      <%= if @form && @field do %>
        <%= input(@form, @field, assigns) %>
      <% else %>
        <.checkbox {assigns} />
      <% end %>
      """
    end

    def input(assigns) do
      ~H"""
      <%= if @form && @field do %>
        <%= input(@form, @field, assigns) %>
      <% else %>
        <input type={@type} class={"input #{@class}"} {assigns} />
      <% end %>
      """
    end

    attr :form, :any, default: nil, doc: """
    Expect to be the context for the form
    """
    attr :field, :atom, default: nil, doc: """
    It must be provided when a context `:form` is passed it gives the ability
    to render correctly
    """
    attr :class, :string, default: "", doc: """
    """
    def checkbox(assigns) do
      assigns = Map.put(assigns, :class, "checkbox #{assigns.class}")
      ~H"""
      <%= if @form && @field do %>
        <%= input(@form, @field, assigns) %>
      <% else %>
        <input type="checkbox" class={@class} {assigns} />
      <% end %>
      """
    end

    attr :form, :any, default: nil, doc: """
    Expect to be the context for the form
    """
    attr :field, :atom, default: nil, doc: """
    It must be provided when a context `:form` is passed it gives the ability
    to render correctly
    """
    attr :class, :string, default: "", doc: """
    """
    def radio(assigns) do
      assigns = Map.put(assigns, :class, "radio #{assigns.class}")
      ~H"""
      <%= if @form && @field do %>
        <%= input(@form, @field, assigns) %>
      <% else %>
        <input type="radio" class={@class} {assigns} />
      <% end %>
      """
    end

    attr :form, :any, default: nil, doc: """
    Expect to be the context for the form
    """
    attr :field, :atom, default: nil, doc: """
    It must be provided when a context `:form` is passed it gives the ability
    to render correctly
    """
    attr :rating_class, :string, default: "mask-star-2", doc: """
    """
    attr :class, :string, default: "", doc: """
    """
    attr :allow_null_rating, :boolean, default: true
    attr :half, :boolean, default: false
    def rating(assigns) do
      assigns =
        assigns
        |> Map.put(:type, "radio")
        |> Map.put(:class, "rating #{assigns.class}")

      items = if assigns.half do
        [{0.5, "mask-half-1"}, {1, "mask-half-2"}, {1.5, "mask-half-1"}, {2, "mask-half-2"}, {2.5, "mask-half-1"}, {3, "mask-half-2"}, {3.5, "mask-half-1"}, {4, "mask-half-2"}, {4.5, "mask-half-1"}, {5, "mask-half-2"}]
      else
        [{1, ""}, {2, ""}, {3, ""}, {4, ""}, {5, ""}]
      end

      ~H"""
      <div class={"#{if @half, do: "rating-half"} #{@class}"}>
        <%= if @form && @field do %>
          <%= if @allow_null_rating do %>
            <%= input(@form, @field, Map.merge(assigns, %{class: "rating-hidden", value: 0})) %>
          <% end %>
          <%= for {value, class} <- items do %>
            <%= input(@form, @field, Map.merge(assigns, %{class: "mask #{@rating_class} #{class}", value: value})) %>
          <% end %>
        <% else %>
          <%= if @allow_null_rating do %>
            <input type={@type} class="rating-hidden" value="0" {assigns} />
          <% end %>
          <%= for {value, class} <- items do %>
            <input type={@type} class={"mask #{@rating_class} #{class}"} value={value} {assigns} />
          <% end %>
        <% end %>
      </div>
      """
    end

    attr :form, :any, default: nil, doc: """
    Expect to be the context for the form
    """
    attr :field, :atom, default: nil, doc: """
    It must be provided when a context `:form` is passed it gives the ability
    to render correctly
    """
    attr :class, :string, default: "", doc: """
    """
    def range(assigns) do
      assigns = Map.put(assigns, :class, "range #{assigns.class}")
      ~H"""
      <%= if @form && @field do %>
        <%= input(@form, @field, assigns) %>
      <% else %>
        <input type="range" class={@class} {assigns} />
      <% end %>
      """
    end

    attr :form, :any, default: nil, doc: """
    Expect to be the context for the form
    """
    attr :field, :atom, default: nil, doc: """
    It must be provided when a context `:form` is passed it gives the ability
    to render correctly
    """
    attr :class, :string, default: "", doc: """
    """
    def select(assigns) do
      IO.inspect("Joining")
      assigns = Map.put(assigns, :class, "select #{assigns.class}")
      {_, attrs} = Map.pop!(assigns, :inner_block)
      ~H"""
      <%= if @form && @field do %>
        <%= select(@form, @field, attrs) %>
      <% else %>
        <select {attrs}>
          <%= render_slot(@inner_block) %>
        </select>
      <% end %>
      """
    end

    attr :class, :string, default: ""
    def option(assigns) do
      {_, attrs} = Map.pop!(assigns, :inner_block)
      ~H"""
      <option class={@class} {attrs}>
        <%= render_slot(@inner_block) %>
      </option>
      """
    end

    attr :form, :any, default: nil, doc: """
    Expect to be the context for the form
    """
    attr :field, :atom, default: nil, doc: """
    It must be provided when a context `:form` is passed it gives the ability
    to render correctly
    """
    attr :class, :string, default: "", doc: """
    """
    def textarea(assigns) do
      assigns = Map.put(assigns, :class, "textarea #{assigns.class}")
      {_, attrs} = Map.pop!(assigns, :inner_block)
      ~H"""
      <%= if @form && @field do %>
        <%= textarea(@form, @field, Enum.into(assigns, [])) %>
      <% else %>
        <textarea {attrs}><%= render_slot(@inner_block) %></textarea>
      <% end %>
      """
    end

    attr :form, :any, default: nil, doc: """
    Expect to be the context for the form
    """
    attr :field, :atom, default: nil, doc: """
    It must be provided when a context `:form` is passed it gives the ability
    to render correctly
    """
    attr :class, :string, default: "", doc: """
    """
    def toggle(assigns) do
      assigns = Map.put(assigns, :class, "toggle #{assigns.class}")
      ~H"""
      <%= if @form && @field do %>
        <%= input(@form, @field, assigns) %>
      <% else %>
        <input type="checkbox" class={@class} {assigns} />
      <% end %>
      """
    end

    def input(form, field, opts \\ []) do
      assigns = %{
        type: opts[:using] || Phoenix.HTML.Form.input_type(form, field),
        container_opts: [class: "form-group #{state_class(form, field)}"],
        label_opts: [class: "label"],
        input_opts: [class: "form-control"]
      }

      ~H"""
      <div {@container_opts}>
        <%= label(form, field, humanize(field), @label_opts) %>
        <%= input(@type, form, field, @input_opts) %>
        <%= maybe_error(form, field, opts) %>
      </div>
      """
    end

    defp state_class(form, field) do
      cond do
        # The form was not yet submitted
        is_nil(form.source.action) -> ""
        # The field has error
        form.errors[field] -> "has-error"
        # The field is blank
        input_value(form, field) in ["", nil] -> ""
        # The field was filled successfully
        true -> "has-success"
      end
    end

    def maybe_error(form, field, %{error_module: error_module}) do
      apply(error_module, :error_tag, [form, field]) || ""
    end

    def maybe_error(form, field, _) do
      error_module = Application.get_env(:daisy_ui, :form_error_module, DaisyUiWeb.ErrorHelpers)
      apply(error_module, :error_tag, [form, field]) || ""
    end

    # Implement clauses below for custom inputs.
    # defp input(:datepicker, form, field, input_opts) do
    #   raise "not yet implemented"
    # end

    defp input(type, form, field, input_opts) do
      apply(Phoenix.HTML.Form, type, [form, field, input_opts])
    end
  end
end
