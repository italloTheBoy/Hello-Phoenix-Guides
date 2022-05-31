defmodule HelloWeb.Plugs.Language do
  import Plug.Conn

  @languages ["pt", "en", "es", "fr"]

  def init(opts), do: opts


  def call(
    %Plug.Conn{params: %{"language" => lang}} = conn,
    _opts
  ) 
    when lang in @languages 
  do
    assign(conn, :language, lang)
  end


  def call(conn, opts) do
    assign(conn, :language, opts)
  end
end