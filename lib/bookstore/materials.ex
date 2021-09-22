defmodule Bookstore.Materials do
  alias Bookstore.Materials

  alias Materials.Book
  defdelegate new_book(params),
    to: Book,
    as: :new

  defdelegate add_book(book),
    to: Book.Store,
    as: :add

  defdelegate all_books(),
    to: Book.Store,
    as: :all

  defdelegate get_book(id),
    to: Book.Store,
    as: :get

  alias Materials.Genre
  defdelegate new_genre(params),
    to: Genre,
    as: :new

  defdelegate add_genre(genre),
    to: Genre.Store,
    as: :add

  defdelegate all_genres(),
    to: Genre.Store,
    as: :all

  defdelegate get_genre(id),
    to: Genre.Store,
    as: :get

  alias Materials.Publisher
  defdelegate new_publisher(params),
    to: Publisher,
    as: :new

  defdelegate add_publisher(publisher),
    to: Publisher.Store,
    as: :add

  defdelegate all_publishers(),
    to: Publisher.Store,
    as: :all

  defdelegate get_publisher(id),
    to: Publisher.Store,
    as: :get
end
