defmodule HelloWeb.UserController do
  use HelloWeb, :controller

  action_fallback HelloWeb.FallbackController
  plug HelloWeb.Plugs.PutUserLayout

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def say_name(conn, params) do
    with {:ok, name} <- bruno?(params["name"]) do
      text(conn, "Your name is #{name}")
    end
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
    "name" => _name,
    "age" => _age,
    "gender" => _gender
  } = params) do
  conn
  |> put_status(200)
  |> json(params)
  end

  defp bruno?(name) do
    if name == "bruno" do
      {:error, :bruno}
    else
      {:ok, name}
    end
  end
end 