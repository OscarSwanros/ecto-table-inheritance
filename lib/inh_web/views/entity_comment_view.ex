defmodule InhWeb.EntityCommentView do
  use InhWeb, :view

  alias InhWeb.EntityCommentView

  def render("index.json", %{comments: c}) do
    render_many(c, EntityCommentView, "comment.json", as: :comment)
  end

  def render("show.json", %{comment: c}) do
    render_one(c, EntityCommentView, "comment.json", as: :comment)
  end

  def render("comment.json", %{comment: c}) do
    %{id: c.id, content: c.content, entity_id: c.entity_id}
  end
end
