defmodule Bookstore.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      Bookstore.Materials.Book.Store,
      Bookstore.Materials.Genre.Store,
      Bookstore.Materials.Publisher.Store,
      Bookstore.People.Author.Store,
      Bookstore.People.Clerk.Store,
      Bookstore.People.Translator.Store,
      Bookstore.Places.Shelf.Store,
      Bookstore.Places.Store.Store,
      {Plug.Cowboy, scheme: :http, plug: Bookstore.Router, port: 4040}
      # Starts a worker by calling: Skool.Worker.start_link(arg)
      # {Skool.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Bookstore.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
