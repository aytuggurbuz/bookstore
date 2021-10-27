defmodule Bookstore.Places do
  alias Bookstore.Places

  alias Places.Shelf

  defdelegate new_shelf(params),
    to: Shelf,
    as: :new

  defdelegate add_shelf(shelf),
    to: Shelf.Store,
    as: :add

  defdelegate all_shelves(),
    to: Shelf.Store,
    as: :all

  defdelegate get_shelf(id),
    to: Shelf.Store,
    as: :get

  defdelegate update_shelf(shelf, params),
    to: Shelf.Store,
    as: :update

  defdelegate delete_shelf(id),
    to: Shelf.Store,
    as: :delete

  defdelegate search_shelf(query),
    to: Shelf.Store,
    as: :search

  alias Places.Store

  defdelegate new_store(params),
    to: Store,
    as: :new

  defdelegate add_store(store),
    to: Store.Store,
    as: :add

  defdelegate all_stores(),
    to: Store.Store,
    as: :all

  defdelegate get_store(id),
    to: Store.Store,
    as: :get

  defdelegate update_store(book, params),
    to: Store.Store,
    as: :update

  defdelegate delete_store(id),
    to: Store.Store,
    as: :delete

  defdelegate search_store(query),
    to: Store.Store,
    as: :search
end
