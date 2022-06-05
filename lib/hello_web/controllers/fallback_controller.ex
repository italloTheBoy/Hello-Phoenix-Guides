defmodule HelloWeb.FallbackController do
  use Phoenix.Controller

  def call(conn, {:error, :bruno}) do
    conn 
    |> put_status(403)
    |> put_view(HelloWeb.ErrorView)
    |> render(:"403")
  end
end