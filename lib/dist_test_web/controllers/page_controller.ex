defmodule DistTestWeb.PageController do
  use DistTestWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
