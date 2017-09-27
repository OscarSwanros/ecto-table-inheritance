defmodule InhWeb.AttachmentView do
  use InhWeb, :view

  alias InhWeb.AttachmentView

  def render("index.json", %{attachments: a}) do
    render_many(a, AttachmentView, "attachment.json", as: :attachment)
  end

  def render("show.json", %{attachment: a}) do
    render_one(a, AttachmentView, "attachment.json", as: :attachment)
  end

  def render("attachment.json", %{attachment: a}) do
    %{id: a.id, url: a.url}
  end
end
