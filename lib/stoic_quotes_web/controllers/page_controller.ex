defmodule StoicQuotesWeb.PageController do
  use StoicQuotesWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
