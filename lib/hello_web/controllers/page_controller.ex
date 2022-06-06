defmodule HelloWeb.PageController do
  use HelloWeb, :controller
  # alias HelloWeb.Router.Helpers, as: Routes

  def index(conn, _params) do
    conn
    |> put_flash(:info, "You are redirected to this page.")
    |> redirect(to: Routes.page_path(conn, :redirection))
  end

  def redirection(conn, _params) do
    conn
    |> render("index.html", hero: "phx-hero")
    
  end 
end

