defmodule InhWeb.PostController do
  use InhWeb, :controller
  alias Inh.Posts

  plug :scrub_params, "post" when action in [:create]

  def index(conn, _params) do
    conn
    |> render("index.json", posts: Posts.all())
  end

  def create(conn, %{"post" => post_params}) do
    with {:ok, new} <- Posts.create_post(post_params) do
      conn
      |> render("show.json", post: new)
    end
  end
end
