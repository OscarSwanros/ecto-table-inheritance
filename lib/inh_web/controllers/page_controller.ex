defmodule InhWeb.PageController do
  use InhWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
