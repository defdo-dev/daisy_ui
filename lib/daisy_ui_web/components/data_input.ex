if Code.ensure_loaded?(Phoenix.LiveView) do
  defmodule DaisyUiWeb.Components.DataInput do
    @moduledoc """
    Data Input Components
    """
    use Phoenix.HTML
    use Phoenix.Component
    import DaisyUi, only: [clean: 1]

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
    attr :type, :string, required: false
    attr :class, :string, default: "", doc: """
    Customize the input using the following classes
    """
    def input(assigns) do
      assigns =
        assigns
        |> assign(:class, "#{maybe_class_by_type(assigns)} #{assigns.class}")
        |> assign(:type, maybe_type(assigns))

      attrs = assigns_to_attributes(assigns)

      ~H"""
      <%= if @form && @field do %>
        <%= input(@type, @form, @field, attrs) %>
      <% else %>
        <input type={String.replace("#{@type}", ["_button", "_input"], "")} {attrs} />
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

      attrs = assigns_to_attributes(assigns)

      ~H"""
      <%= if @form && @field do %>
        <%= input(:checkbox, @form, @field, attrs) %>
      <% else %>
        <input type="checkbox" class={@class} {attrs} />
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
        <%= input(:radio, @form, @field, assigns) %>
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
            <%= input(@type, @form, @field, Map.merge(assigns, %{class: "rating-hidden", value: 0})) %>
          <% end %>
          <%= for {value, class} <- items do %>
            <%= input(@type, @form, @field, Map.merge(assigns, %{class: "mask #{@rating_class} #{class}", value: value})) %>
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
        <%= input(:range, @form, @field, assigns) %>
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
    attr :options, :list, default: []
    attr :prompt, :string, default: nil
    attr :selected, :boolean, default: false
    def select(assigns) do
      assigns = Map.put(assigns, :class, "select #{assigns.class}")
      attrs =
        assigns
        |> assigns_to_attributes()
        |> Keyword.drop([:form, :field, :options])

      ~H"""
      <%= if @form && @field do %>
        <%= select(@form, @field, @options, attrs) %>
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
      assigns = assign(assigns, :class, "toggle #{assigns.class}")
      ~H"""
      <%= if @form && @field do %>
        <%= input(:checkbox, @form, @field, assigns) %>
      <% else %>
        <input type="checkbox" class={@class} {assigns} />
      <% end %>
      """
    end

    # def input(form, field, opts \\ []) do
    #   assigns = %{
    #     type: opts[:using] || Phoenix.HTML.Form.input_type(form, field),
    #     container_opts: [class: state_class(form, field)],
    #     label_opts: [class: "label"],
    #     input_opts: [class: get_in(opts, [:class]) || ""]
    #   }

    #   ~H"""
    #   <.form_control {@container_opts}>
    #     <%= label(form, field, humanize(field), @label_opts) %>
    #     <%= input(@type, form, field, opts) %>
    #     <%= maybe_error(form, field, opts) %>
    #   </.form_control>
    #   """
    # end

    # defp state_class(form, field) do
    #   cond do
    #     # The form was not yet submitted
    #     is_nil(form.source.action) -> ""
    #     # The field has error
    #     form.errors[field] -> "has-error"
    #     # The field is blank
    #     input_value(form, field) in ["", nil] -> ""
    #     # The field was filled successfully
    #     true -> "has-success"
    #   end
    # end

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

    defp input(type, form, field, input_opts) when is_atom(type) do
      apply(Phoenix.HTML.Form, type, [form, field, clean(input_opts)])
    end

    defp maybe_type(%{using: using}), do: using
    defp maybe_type(%{type: type}), do: type
    defp maybe_type(%{form: form, field: field}) when not is_nil(form) and not is_nil(field) do
      Phoenix.HTML.Form.input_type(form, field)
    end
    defp maybe_type(_assigns), do: :text_input

    defp maybe_class_by_type(assigns) do
      case maybe_type(assigns) do
        type when type in ["radio", :radio_button] -> "radio"
        type when type in ["checkbox", :checkbox] -> "checkbox"

        _ -> "input"
      end
    end

  end
end
