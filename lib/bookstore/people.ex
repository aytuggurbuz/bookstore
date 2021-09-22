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
end
