defmodule HelloWeb.HelloController do
  use HelloWeb, :controller

  def hello(conn, _params) do
    render(conn, "index.html")
  end

  def hello_itallo(conn, _params) do
    render(conn, "index.html", name: "princeso")
  end

  def hello_to(conn, %{"name" => name}) do
    render(conn, "index.html", name: name)
  end
end
