defmodule EPharmWeb.Helpers.IconHelper do

  use Phoenix.HTML
  alias EPharmWeb.Router

  def icon(name, opts) do
    classes = Keyword.get(opts, :class, "") <> " icon"

    content_tag(:svg, class: classes) do
      tag(:use, "xlink:href": "/images/icons.svg#" <> name)
    end
  end
end