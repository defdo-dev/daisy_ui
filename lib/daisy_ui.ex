defmodule DaisyUi do
  @moduledoc """
  DaisyUi keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """
  defmacro __using__(_opts) do
    quote do
      import DaisyUiWeb.Components.Actions
      import DaisyUiWeb.Components.DataDisplay
      import DaisyUiWeb.Components.DataInput
      import DaisyUiWeb.Components.Layout
      import DaisyUiWeb.Components.Mockup
      import DaisyUiWeb.Components.Navigation
    end
  end

  def clean(attrs, keys \\ [:form, :field, :type]) do
    Keyword.drop(attrs, keys)
  end
end
