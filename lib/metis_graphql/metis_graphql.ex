defmodule MetisGraphQL do
  def document_providers(_) do
    [Absinthe.Plug.DocumentProvider.Default, MetisGraphQL.CompiledQueries]
  end
end
