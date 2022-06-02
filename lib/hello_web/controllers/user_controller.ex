defmodule HelloWeb.UserController do
  use HelloWeb, :controller

  plug HelloWeb.Plugs.PutUserLayout

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def say_name(conn, %{"name" => name}) do
    text(conn, "Your name is #{name}")
  end

  def perfil(conn, %{
    "name" => name,
    "age" => age,
    "gender" => gender
  }) do
    conn 
    |> assign(:name, name)
    |> assign(:age, age)
    |> assign(:gender, gender)
    |> render("index.html") 
  end

  def perfil_api(conn, %{
    "name" => name,
    "age" => age,
    "gender" => gender
  } = params) do
  conn
  |> put_status(200)
  |> json(params)
  end
end 