defmodule MetisWeb.Errors.View do
  use Phoenix.View, root: "lib/metis_web", path: "errors/templates", namespace: MetisWeb

  def template_not_found(template, _assigns) do
    Phoenix.Controller.status_message_from_template(template)
  end
end
