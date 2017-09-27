defmodule InhWeb.AttachmentCommentController do
  use InhWeb, :controller

  alias Inh.EntityComments
  plug :scrub_params, "comment" when action in [:create]

  def index(conn, %{"attachment_id" => a_id}) do
    conn
    |> put_view(InhWeb.EntityCommentView)
    |> render("index.json", comments: EntityComments.all_for_entity_type(a_id, "attachment"))
  end

  def create(conn, %{"attachment_id" => a_id, "comment" => c_params}) do
    with {:ok, new} <- EntityComments.create_for_entity(a_id, "attachment", c_params) do
      conn
      |> put_view(InhWeb.EntityCommentView)
      |> render("show.json", comment: new)
    end
  end
end
