defmodule InhWeb.Router do
  use InhWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", InhWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  scope "/api", InhWeb do
    pipe_through :api

    resources "/posts", PostController do
      resources "/comments", PostCommentController
    end

    resources "/attachments", AttachmentController do
      resources "/comments", AttachmentCommentController
    end
  end
end
