defmodule MetisGraphQL.Router do
  use Plug.Router

  defmodule GraphQL do
    use Plug.Router

    plug(:match)
    plug(:dispatch)

    forward("/",
      to: Absinthe.Plug,
      init_opts: [
        document_providers: {MetisGraphQL, :document_providers},
        json_codec: Jason,
        schema: MetisGraphQL.Schema
      ]
    )
  end

  plug(MetisGraphQL.Plugs.Context)

  plug(:match)
  plug(:dispatch)

  forward("/graphql", to: GraphQL)

  match(_, do: conn)
end
