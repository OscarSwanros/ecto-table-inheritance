defmodule InhWeb.PostView do
  use InhWeb, :view

  alias InhWeb.PostView

  def render("index.json", %{posts: posts}) do
    render_many(posts, PostView, "post.json", as: :post)
  end

  def render("show.json", %{post: post}) do
    render_one(post, PostView, "post.json", as: :post)
  end

  def render("post.json", %{post: post}) do
    %{id: post.id, content: post.content, inserted_at: post.inserted_at}
  end
end
