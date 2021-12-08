defmodule MetisWeb.Layouts.View do
  use Phoenix.View, root: "lib/metis_web", path: "layouts/templates", namespace: MetisWeb
  use Phoenix.HTML

  import Phoenix.Controller, only: [get_flash: 2]

  alias MetisWeb.Router.Helpers, as: Routes
end
