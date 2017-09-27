defmodule InhWeb.AttachmentController do
  use InhWeb, :controller
  alias Inh.Attachments

  plug :scrub_params, "attachment" when action in [:create]

  def index(conn, _params) do
    conn
    |> render("index.json", %{attachments: Attachments.all()})
  end

  def create(conn, %{"attachment" => a_params}) do
    with {:ok, att} <- Attachments.create_attachment(a_params) do
      conn
      |> render("show.json", attachment: att)
    end
  end
end

