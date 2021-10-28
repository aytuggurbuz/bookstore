defmodule Bookstore.Router do
  use Plug.Router

  plug(:match)

  plug(Plug.Parsers,
    parsers: [:json],
    json_decoder: Jason
  )

  plug(:dispatch)

  alias Bookstore.Materials

  get "/genres" do
    genres = Materials.all_genres()

    conn
    |> send_resp(200, Jason.encode!(genres))
  end

  post "/genres" do
    Map.new(conn.body_params, fn {k, v} -> {String.to_atom(k), v} end)
    |> Materials.new_genre()
    |> Materials.add_genre()

    send_resp(conn, 200, "Sucessfully added the genre!")
  end

  get "/books" do
    books = Materials.all_books()

    conn
    |> send_resp(200, Jason.encode!(books))
  end

  get "/publishers" do
    publishers = Materials.all_publishers()

    conn
    |> send_resp(200, Jason.encode!(publishers))
  end

  alias Bookstore.People

  get "/authors" do
    authors = People.all_authors()

    conn
    |> send_resp(200, Jason.encode!(authors))
  end

  get "/clerks" do
    clerks = People.all_clerks()

    conn
    |> send_resp(200, Jason.encode!(clerks))
  end

  get "/translators" do
    translators = People.all_translators()

    conn
    |> send_resp(200, Jason.encode!(translators))
  end

  alias Bookstore.Places

  get "/shelves" do
    shelves = Places.all_shelves()

    conn
    |> send_resp(200, Jason.encode!(shelves))
  end

  get "/stores" do
    stores = Places.all_stores()

    conn
    |> send_resp(200, Jason.encode!(stores))
  end
end
