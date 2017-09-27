defmodule InhWeb.PostCommentController do
  use InhWeb, :controller

  alias Inh.EntityComments

  def index(conn, %{"post_id" => post_id}) do
    conn
    |> put_view(InhWeb.EntityCommentView)
    |> render("index.json", comments: EntityComments.all_for_entity_type(post_id, "post"))
  end

  def create(conn, %{"post_id" => post_id, "comment" => comment_params}) do
    with {:ok, comment} <- EntityComments.create_for_entity(post_id, "post", comment_params) do
      conn
      |> put_view(InhWeb.EntityCommentView)
      |> render("show.json", comment: comment)
    else error ->
      IO.inspect error
    end
  end
end
