defmodule HelloWeb.Plugs.PutUserLayout do
  def init(opts), do: opts

  def call(conn, _opts) do
    Phoenix.Controller.put_root_layout(conn, "user.html")
  end
end