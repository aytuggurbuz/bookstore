defmodule Bookstore.Materials.Book do
  @derive Jason.Encoder
  @enforce_keys [:id, :name, :author, :genre, :year, :price, :pages, :language, :translator]
  defstruct [:id, :name, :author, :genre, :year, :price, :pages, :language, :translator]

  defmodule Store do
    use Bookstore.Storage.Base
  end

  alias Bookstore.Storage.Association
  def new(%{
        name: name,
        author: author,
        genre: genre,
        year: year,
        price: price,
        pages: pages,
        language: language,
        translator: translator
      }) do
    %__MODULE__{
      id: UUID.uuid4(),
      name: name,
      author: Association.new(author),
      genre: Association.new(genre),
      year: year,
      price: price,
      pages: pages,
      language: language,
      translator: Association.new(translator),
    }
  end
end
