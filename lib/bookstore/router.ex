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
    if conn.params == %{} do
      genres = Materials.all_genres()
      send_resp(conn, 200, Jason.encode!(genres))
    else
      searchTerm = Enum.map(conn.params, fn {k, v} -> {String.to_atom(k), v} end)
      send_resp(conn, 200, Jason.encode!(Materials.search_genre(searchTerm)))
    end
  end

  post "/genres" do
    Map.new(conn.body_params, fn {k, v} -> {String.to_atom(k), v} end)
    |> Materials.new_genre()
    |> Materials.add_genre()

    send_resp(conn, 200, "Successfully added the genre!")
  end

  get "/books" do
    if conn.params == %{} do
      books = Materials.all_books()
      send_resp(conn, 200, Jason.encode!(books))
    else
      searchTerm = Enum.map(conn.params, fn {k, v} -> {String.to_atom(k), v} end)
      send_resp(conn, 200, Jason.encode!(Materials.search_book(searchTerm)))
    end
  end

  post "/books" do
    Map.new(conn.body_params, fn {k, v} -> {String.to_atom(k), v} end)
    |> Materials.new_book()
    |> Materials.add_book()

    send_resp(conn, 200, "Successfully added the book!")
  end

  get "/publishers" do
    if conn.params == %{} do
      publishers = Materials.all_publishers()
      send_resp(conn, 200, Jason.encode!(publishers))
    else
      searchTerm = Enum.map(conn.params, fn {k, v} -> {String.to_atom(k), v} end)
      send_resp(conn, 200, Jason.encode!(Materials.search_publisher(searchTerm)))
    end
  end

  post "/publishers" do
    Map.new(conn.body_params, fn {k, v} -> {String.to_atom(k), v} end)
    |> Materials.new_publisher()
    |> Materials.add_publisher()

    send_resp(conn, 200, "Successfully added the publisher!")
  end

  alias Bookstore.People

  get "/authors" do
    if conn.params == %{} do
      authors = People.all_authors()
      send_resp(conn, 200, Jason.encode!(authors))
    else
      searchTerm = Enum.map(conn.params, fn {k, v} -> {String.to_atom(k), v} end)
      send_resp(conn, 200, Jason.encode!(People.search_author(searchTerm)))
    end
  end

  post "/authors" do
    Map.new(conn.body_params, fn {k, v} -> {String.to_atom(k), v} end)
    |> People.new_author()
    |> People.add_author()

    send_resp(conn, 200, "Successfully added the author!")
  end

  get "/clerks" do
    if conn.params == %{} do
      clerks = People.all_clerks()
      send_resp(conn, 200, Jason.encode!(clerks))
    else
      searchTerm = Enum.map(conn.params, fn {k, v} -> {String.to_atom(k), v} end)
      send_resp(conn, 200, Jason.encode!(People.search_clerk(searchTerm)))
    end
  end

  post "/clerks" do
    Map.new(conn.body_params, fn {k, v} -> {String.to_atom(k), v} end)
    |> People.new_clerk()
    |> People.add_clerk()

    send_resp(conn, 200, "Successfully added the clerk!")
  end

  get "/translators" do
    if conn.params == %{} do
      translators = People.all_translators()
      send_resp(conn, 200, Jason.encode!(translators))
    else
      searchTerm = Enum.map(conn.params, fn {k, v} -> {String.to_atom(k), v} end)
      send_resp(conn, 200, Jason.encode!(People.search_translator(searchTerm)))
    end
  end

  post "/translators" do
    Map.new(conn.body_params, fn {k, v} -> {String.to_atom(k), v} end)
    |> People.new_translator()
    |> People.add_translator()

    send_resp(conn, 200, "Successfully added the translator!")
  end

  alias Bookstore.Places

  get "/shelves" do
    if conn.params == %{} do
      shelves = Places.all_shelves()
      send_resp(conn, 200, Jason.encode!(shelves))
    else
      searchTerm = Enum.map(conn.params, fn {k, v} -> {String.to_atom(k), v} end)
      send_resp(conn, 200, Jason.encode!(Places.search_shelf(searchTerm)))
    end
  end

  post "/shelves" do
    Map.new(conn.body_params, fn {k, v} -> {String.to_atom(k), v} end)
    |> Places.new_shelf()
    |> Places.add_shelf()

    send_resp(conn, 200, "Successfully added the shelf!")
  end

  get "/stores" do
    if conn.params == %{} do
      stores = Places.all_stores()
      send_resp(conn, 200, Jason.encode!(stores))
    else
      searchTerm = Enum.map(conn.params, fn {k, v} -> {String.to_atom(k), v} end)
      send_resp(conn, 200, Jason.encode!(Places.search_store(searchTerm)))
    end
  end

  post "/stores" do
    Map.new(conn.body_params, fn {k, v} -> {String.to_atom(k), v} end)
    |> Places.new_store()
    |> Places.add_store()

    send_resp(conn, 200, "Successfully added the store!")
  end
end
