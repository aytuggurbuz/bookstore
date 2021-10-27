defmodule Bookstore.People do
  alias Bookstore.People

  alias People.Author

  defdelegate new_author(params),
    to: Author,
    as: :new

  defdelegate add_author(author),
    to: Author.Store,
    as: :add

  defdelegate all_authors(),
    to: Author.Store,
    as: :all

  defdelegate get_author(id),
    to: Author.Store,
    as: :get

  defdelegate update_author(author, params),
    to: Author.Store,
    as: :update

  defdelegate delete_author(id),
    to: Author.Store,
    as: :delete

  defdelegate search_author(query),
    to: Author.Store,
    as: :search

  alias People.Clerk

  defdelegate new_clerk(params),
    to: Clerk,
    as: :new

  defdelegate add_clerk(clerk),
    to: Clerk.Store,
    as: :add

  defdelegate all_clerks(),
    to: Clerk.Store,
    as: :all

  defdelegate get_clerk(id),
    to: Clerk.Store,
    as: :get

  defdelegate update_clerk(clerk, params),
    to: Clerk.Store,
    as: :update

  defdelegate delete_clerk(id),
    to: Clerk.Store,
    as: :delete

  defdelegate search_clerk(query),
    to: Clerk.Store,
    as: :search

  alias People.Translator

  defdelegate new_translator(params),
    to: Translator,
    as: :new

  defdelegate add_translator(translator),
    to: Translator.Store,
    as: :add

  defdelegate all_translators(),
    to: Translator.Store,
    as: :all

  defdelegate get_translator(id),
    to: Translator.Store,
    as: :get

  defdelegate update_translator(translator, params),
    to: Translator.Store,
    as: :update

  defdelegate delete_translator(id),
    to: Translator.Store,
    as: :delete

  defdelegate search_translator(query),
    to: Translator.Store,
    as: :search
end
