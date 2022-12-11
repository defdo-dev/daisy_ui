if Code.ensure_loaded?(Phoenix.LiveView) do
  defmodule DaisyUiWeb.Components.DataInput do
    @moduledoc """
    Data Input Components
    """
    use Phoenix.Component

    attr :class, :string, default: "w-full max-w-xs"
    slot :inner_block, required: true

    def form_control(assigns) do
      ~H"""
      <div class={"form-control #{@class}"}>
        <%= render_slot(@inner_block) %>
      </div>
      """
    end

    attr :class, :string, default: ""
    slot :inner_block, required: true

    def label_control(assigns) do
      ~H"""
      <label class={"label #{@class}"}>
        <%= render_slot(@inner_block) %>
      </label>
      """
    end

    attr :class, :string, default: ""
    slot :inner_block, required: true

    def label_text(assigns) do
      ~H"""
      <span class={"label-text #{@class}"}>
        <%= render_slot(@inner_block) %>
      </span>
      """
    end

    attr :class, :string, default: ""
    slot :inner_block, required: true

    def label_text_alt(assigns) do
      ~H"""
      <span class={"label-text-alt #{@class}"}>
        <%= render_slot(@inner_block) %>
      </span>
      """
    end

    @doc """
    Renders an input with label and error messages.

    A `%Phoenix.HTML.Form{}` and field name may be passed to the input
    to build input names and error messages, or all the attributes and
    errors may be passed explicitly.

    ## Examples

        <.input field={{f, :email}} type="email" />
        <.input name="my-input" errors={["oh no!"]} />
    """
    attr :id, :any
    attr :name, :any
    attr :label, :string, default: nil

    attr :class, :string,
      default: nil,
      doc: """

      ### Checkbox

        | Class name         | Type       | Details                      |
        |--------------------|------------|------------------------------|
        | checkbox-primary   | Modifier   | Adds `primary` to checkbox   |
        | checkbox-secondary | Modifier   | Adds `secondary` to checkbox |
        | checkbox-accent    | Modifier   | Adds `accent` to checkbox    |
        | checkbox-success   | Modifier   | Adds `success` to checkbox   |
        | checkbox-warning   | Modifier   | Adds `warning` to checkbox   |
        | checkbox-info      | Modifier   | Adds `info` to checkbox      |
        | checkbox-error     | Modifier   | Adds `error` to checkbox     |
        | checkbox-lg        | Responsive | Large checkbox               |
        | checkbox-md        | Responsive | Medium checkbox (default)    |
        | checkbox-sm        | Responsive | Small checkbox               |
        | checkbox-xs        | Responsive | Extra small checkbox         |

      ### File input

      | Class name           | Type       | Details                         |
      |----------------------|------------|---------------------------------|
      | file-input-bordered  | Modifier   | Adds border to input            |
      | file-input-ghost     | Modifier   | Adds ghost style to input       |
      | file-input-primary   | Modifier   | Adds `primary` color to input   |
      | file-input-secondary | Modifier   | Adds `secondary` color to input |
      | file-input-accent    | Modifier   | Adds `accent` color to input    |
      | file-input-info      | Modifier   | Adds `info` color to input      |
      | file-input-success   | Modifier   | Adds `success` color to input   |
      | file-input-warning   | Modifier   | Adds `warning` color to input   |
      | file-input-error     | Modifier   | Adds `error` color to input     |
      | file-input-lg        | Responsive | Large size for input            |
      | file-input-md        | Responsive | Medium (default) size for input |
      | file-input-sm        | Responsive | Small size for input            |
      | file-input-xs        | Responsive | Extra small size for input      |

      ### Radio

      | Class name      | Type       | Details                   |
      |-----------------|------------|---------------------------|
      | radio-primary   | Modifier   | Adds `primary` to radio   |
      | radio-secondary | Modifier   | Adds `secondary` to radio |
      | radio-accent    | Modifier   | Adds `accent` to radio    |
      | radio-success   | Modifier   | Adds `success` to radio   |
      | radio-warning   | Modifier   | Adds `warning` to radio   |
      | radio-info      | Modifier   | Adds `info` to radio      |
      | radio-error     | Modifier   | Adds `error` to radio     |
      | radio-lg        | Responsive | Large radio               |
      | radio-md        | Responsive | Medium radio (default)    |
      | radio-sm        | Responsive | Small radio               |
      | radio-xs        | Responsive | Extra small radio         |

      ### Range

      | Class name      | Type       | Details                   |
      |-----------------|------------|---------------------------|
      | range-primary   | Modifier   | Adds `primary` to range   |
      | range-secondary | Modifier   | Adds `secondary` to range |
      | range-accent    | Modifier   | Adds `accent` to range    |
      | range-success   | Modifier   | Adds `success` to range   |
      | range-warning   | Modifier   | Adds `warning` to range   |
      | range-info      | Modifier   | Adds `info` to range      |
      | range-error     | Modifier   | Adds `error` to range     |
      | range-lg        | Responsive | Large range               |
      | range-md        | Responsive | Medium range (default)    |
      | range-sm        | Responsive | Small range               |
      | range-xs        | Responsive | Extra small range         |

      ### Rating

      | Class name    | Type       | Details                                         |
      |---------------|------------|-------------------------------------------------|
      | rating-half   | Modifier   | To shows half of the shape                      |
      | rating-hidden | Modifier   | hides the input. Useful to clear the the rating |
      | rating-lg     | Responsive | Large rating                                    |
      | rating-md     | Responsive | Medium rating (default)                         |
      | rating-sm     | Responsive | Small rating                                    |
      | rating-xs     | Responsive | Extra small rating                              |


      ### Select

      | Class name       | Type       | Details                          |
      |------------------|------------|----------------------------------|
      | select-bordered  | Modifier   | Adds border to select            |
      | select-ghost     | Modifier   | Adds ghost style to select       |
      | select-primary   | Modifier   | Adds `primary` color to select   |
      | select-secondary | Modifier   | Adds `secondary` color to select |
      | select-accent    | Modifier   | Adds `accent` color to select    |
      | select-info      | Modifier   | Adds `info` color to select      |
      | select-success   | Modifier   | Adds `success` color to select   |
      | select-warning   | Modifier   | Adds `warning` color to select   |
      | select-error     | Modifier   | Adds `error` color to select     |
      | select-lg        | Responsive | Large size for select            |
      | select-md        | Responsive | Medium (default) size for select |
      | select-sm        | Responsive | Small size for select            |
      | select-xs        | Responsive | Extra small size for select      |

      ### Text input

      | Class name      | Type       | Details                         |
      |-----------------|------------|---------------------------------|
      | input-bordered  | Modifier   | Adds border to input            |
      | input-ghost     | Modifier   | Adds ghost style to input       |
      | input-primary   | Modifier   | Adds `primary` color to input   |
      | input-secondary | Modifier   | Adds `secondary` color to input |
      | input-accent    | Modifier   | Adds `accent` color to input    |
      | input-info      | Modifier   | Adds `info` color to input      |
      | input-success   | Modifier   | Adds `success` color to input   |
      | input-warning   | Modifier   | Adds `warning` color to input   |
      | input-error     | Modifier   | Adds `error` color to input     |
      | input-lg        | Responsive | Large size for input            |
      | input-md        | Responsive | Medium (default) size for input |
      | input-sm        | Responsive | Small size for input            |
      | input-xs        | Responsive | Extra small size for input      |

      ### Textarea

      | Class name         | Type     | Details                            |
      |--------------------|----------|------------------------------------|
      | textarea-bordered  | Modifier | Adds border to textarea            |
      | textarea-ghost     | Modifier | Adds ghost style to textarea       |
      | textarea-primary   | Modifier | Adds `primary` color to textarea   |
      | textarea-secondary | Modifier | Adds `secondary` color to textarea |
      | textarea-accent    | Modifier | Adds `accent` color to textarea    |
      | textarea-info      | Modifier | Adds `info` color to textarea      |
      | textarea-success   | Modifier | Adds `success` color to textarea   |
      | textarea-warning   | Modifier | Adds `warning` color to textarea   |
      | textarea-error     | Modifier | Adds `error` color to textarea     |

      ### Toggle

      | Class name       | Type       | Details                    |
      |------------------|------------|----------------------------|
      | toggle-primary   | Modifier   | Adds `primary` to toggle   |
      | toggle-secondary | Modifier   | Adds `secondary` to toggle |
      | toggle-accent    | Modifier   | Adds `accent` to toggle    |
      | toggle-success   | Modifier   | Adds `success` to toggle   |
      | toggle-warning   | Modifier   | Adds `warning` to toggle   |
      | toggle-info      | Modifier   | Adds `info` to toggle      |
      | toggle-error     | Modifier   | Adds `error` to toggle     |
      | toggle-lg        | Responsive | Large toggle               |
      | toggle-md        | Responsive | Medium toggle (default)    |
      | toggle-sm        | Responsive | Small toggle               |
      | toggle-xs        | Responsive | Extra small toggle         |

      """

    attr :type, :string,
      default: "text",
      values: ~w(checkbox color date datetime-local email file hidden month number password
               range radio search select tel text textarea time url week rating)

    attr :value, :any
    attr :field, :any, doc: "a %Phoenix.HTML.Form{}/field name tuple, for example: {f, :email}"
    attr :errors, :list, default: []
    attr :checked, :boolean, doc: "the checked flag for checkbox inputs"
    attr :prompt, :string, default: nil, doc: "the prompt for select inputs"
    attr :options, :list, doc: "the options to pass to Phoenix.HTML.Form.options_for_select/2"
    attr :multiple, :boolean, default: false, doc: "the multiple flag for select inputs"
    attr :range_steps, :integer, default: 0, doc: "A fancy rule to display below to the range"
    attr :rating_half, :boolean, default: false

    attr :rating_class, :string,
      default: "mask-star-2",
      doc: """
      An attribute to customize styles or change the shape of the rating symbol.

      Most used:

      | Class name      | Type     | Details                              |
      |-----------------|----------|--------------------------------------|
      | mask-star       | Modifier | Applies `star` shape                 |
      | mask-star-2     | Modifier | Applies `star` alternative shape     |
      | mask-diamond    | Modifier | Applies `diamond` shape              |
      | mask-heart      | Modifier | Applies `heart` shape                |
      | mask-triangle-4 | Modifier | Applies `triangle` alternative shape |

      All options are defined at `DaisyUiWeb.Components.Layout.mask/1`, Keep in mind you should add the `mask-` prefix with this component.
      """

    attr :rest, :global, include: ~w(autocomplete disabled form max maxlength min minlength
                                   pattern placeholder readonly required size step)
    slot :inner_block

    def input(%{field: {f, field}} = assigns) do
      assigns
      |> assign(field: nil)
      |> assign_new(:name, fn ->
        name = Phoenix.HTML.Form.input_name(f, field)
        if assigns.multiple, do: name <> "[]", else: name
      end)
      |> assign_new(:id, fn -> Phoenix.HTML.Form.input_id(f, field) end)
      |> assign_new(:value, fn -> Phoenix.HTML.Form.input_value(f, field) end)
      |> assign_new(:errors, fn -> translate_errors(f.errors || [], field) end)
      |> input()
    end

    def input(%{type: type} = assigns) when type in ["checkbox", "radio", "toggle"] do
      assigns = assign_new(assigns, :checked, fn -> input_equals?(assigns.value, "true") end)

      ~H"""
      <div>
        <label
          phx-feedback-for={@name}
          class="label items-center gap-3 text-sm leading-6 text-content cursor-pointer"
        >
          <input type="hidden" name={@name} value="false" />
          <input
            type={if @type == "toggle", do: "checkbox", else: @type}
            id={@id || @name}
            name={@name}
            value="true"
            checked={@checked}
            class={"#{@type} #{@class}"}
            {@rest}
          />
          <%= @label %>
        </label>
        <.error :for={msg <- @errors}><%= msg %></.error>
      </div>
      """
    end

    def input(%{type: "file"} = assigns) do
      ~H"""
      <div phx-feedback-for={@name}>
        <input
          type="file"
          id={@id || @name}
          name={@name}
          value={@value}
          class={[
            "file-input #{@class}",
            input_border(@errors)
          ]}
          {@rest}
        />
        <.error :for={msg <- @errors}><%= msg %></.error>
      </div>
      """
    end

    def input(%{type: "range"} = assigns) do
      ~H"""
      <div phx-feedback-for={@name}>
        <.label for={@id}><%= @label %></.label>
        <input
          type={@type}
          name={@name}
          id={@id || @name}
          value={@value}
          class={[
            "range #{@class}",
            input_border(@errors)
          ]}
          {@rest}
        />
        <div class="flex justify-between w-full px-2 text-xs">
          <span :for={_step <- 0..(@range_steps - 1)} :if={@range_steps > 0}>|</span>
        </div>
        <.error :for={msg <- @errors}><%= msg %></.error>
      </div>
      """
    end

    def input(%{type: "rating"} = assigns) do
      assigns =
        assign_new(assigns, :items, fn ->
          max = Map.get(assigns, :max, 5)
          default_rating_items(max, assigns.rating_half)
        end)

      ~H"""
      <div class={"rating #{if @rating_half, do: "rating-half"} #{@class}"}>
        <%= for [value, class] <- @items do %>
          <input
            type="radio"
            name={@name}
            id={@id || @name}
            value={value}
            checked={value == "#{@value}"}
            class={[
              "mask #{class}",
              if(value in ["0.0"], do: "rating-hidden", else: ""),
              @rating_class
            ]}
            {@rest}
          />
        <% end %>
      </div>
      """
    end

    def input(%{type: "select"} = assigns) do
      ~H"""
      <div phx-feedback-for={@name}>
        <.label for={@id}><%= @label %></.label>
        <select id={@id} name={@name} class={"select #{@class}"} multiple={@multiple} {@rest}>
          <option :if={@prompt}><%= @prompt %></option>
          <%= Phoenix.HTML.Form.options_for_select(@options, @value) %>
        </select>
        <.error :for={msg <- @errors}><%= msg %></.error>
      </div>
      """
    end

    def input(%{type: "textarea"} = assigns) do
      # "phx-no-feedback:border-zinc-300 phx-no-feedback:focus:border-zinc-400 phx-no-feedback:focus:ring-zinc-800/5"
      ~H"""
      <div phx-feedback-for={@name}>
        <.label for={@id}><%= @label %></.label>
        <textarea
          id={@id || @name}
          name={@name}
          class={[
            "textarea #{@class}",
            input_border(@errors)
          ]}
          {@rest}
        ><%= @value %></textarea>
        <.error :for={msg <- @errors}><%= msg %></.error>
      </div>
      """
    end

    def input(assigns) do
      # "phx-no-feedback:border-red-300 phx-no-feedback:focus:border-red-400 phx-no-feedback:focus:ring-red-800/5"
      ~H"""
      <div phx-feedback-for={@name}>
        <.label for={@id}><%= @label %></.label>
        <input
          type={@type}
          name={@name}
          id={@id || @name}
          value={@value}
          class={[
            "input #{@class}",
            input_border(@errors)
          ]}
          {@rest}
        />
        <.error :for={msg <- @errors}><%= msg %></.error>
      </div>
      """
    end

    defp input_border([] = _errors),
      do: "input-bordered"

    defp input_border([_ | _] = _errors),
      do: "input-bordered input-error"

    @doc """
    Generates a generic error message.
    """
    slot :inner_block, required: true

    def error(assigns) do
      ~H"""
      <p class="phx-no-feedback:hidden mt-1 flex gap-2 text-sm leading-6 text-error">
        <Heroicons.exclamation_circle mini class="mt-0.5 h-5 w-5 flex-none fill-error/90" />
        <%= render_slot(@inner_block) %>
      </p>
      """
    end

    @doc """
    Renders a label.
    """
    attr :for, :string, default: nil
    slot :inner_block, required: true

    def label(assigns) do
      ~H"""
      <label for={@for} class="label text-sm font-semibold leading-6">
        <%= render_slot(@inner_block) %>
      </label>
      """
    end

    @doc """
    Translates an error message using gettext.
    """
    def translate_error({msg, opts}) do
      # When using gettext, we typically pass the strings we want
      # to translate as a static argument:
      #
      #     # Translate "is invalid" in the "errors" domain
      #     dgettext("errors", "is invalid")
      #
      #     # Translate the number of files with plural rules
      #     dngettext("errors", "1 file", "%{count} files", count)
      #
      # Because the error messages we show in our forms and APIs
      # are defined inside Ecto, we need to translate them dynamically.
      # This requires us to call the Gettext module passing our gettext
      # backend as first argument.
      #
      # Note we use the "errors" domain, which means translations
      # should be written to the errors.po file. The :count option is
      # set by Ecto and indicates we should also apply plural rules.
      if count = opts[:count] do
        Gettext.dngettext(DevAppWeb.Gettext, "errors", msg, msg, count, opts)
      else
        Gettext.dgettext(DevAppWeb.Gettext, "errors", msg, opts)
      end
    end

    @doc """
    Translates the errors for a field from a keyword list of errors.
    """
    def translate_errors(errors, field) when is_list(errors) do
      for {^field, {msg, opts}} <- errors, do: translate_error({msg, opts})
    end

    defp input_equals?(val1, val2) do
      Phoenix.HTML.html_escape(val1) == Phoenix.HTML.html_escape(val2)
    end

    attr :id, :any
    attr :name, :any
    attr :label, :string, default: nil
    attr :value, :any

    attr :class, :string,
      default: "",
      doc: """
      """

    def checkbox(assigns) do
      assigns
      |> assign_new(:type, fn -> "checkbox" end)
      |> input()
    end

    attr :id, :any
    attr :name, :any
    attr :label, :string, default: nil
    attr :value, :any
    attr :class, :string, default: ""

    attr :rating_class, :string,
      default: "mask-star-2",
      doc: """
      """

    attr :rating_half, :boolean, default: false
    attr :max, :integer

    def rating(assigns) do
      assigns
      |> assign_new(:type, fn -> "rating" end)
      |> input()
    end

    attr :id, :any
    attr :name, :any
    attr :label, :string, default: nil
    attr :value, :any

    attr :class, :string,
      default: "",
      doc: """
      """

    def toggle(assigns) do
      assigns
      |> assign_new(:type, fn -> "toggle" end)
      |> input()
    end

    defp default_rating_items(max, true) do
      for i <- 0..(max * 2) do
        class = if rem(i, 2) == 0, do: "mask-half-2", else: "mask-half-1"
        ["#{i / 2}", class]
      end
    end

    defp default_rating_items(max, _) do
      for i <- 0..max do
        ["#{i / 1}", ""]
      end
    end
  end
end
