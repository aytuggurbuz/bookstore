defmodule Bookstore.Materials.Book do
  @derive Jason.Encoder
  @enforce_keys [:id, :name, :author, :genre, :year, :price, :pages, :language, :translator]
  defstruct [:id, :name, :author, :genre, :year, :price, :pages, :language, :translator]

  defmodule Store do
    use Bookstore.Storage.Base
  end
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
      author: author,
      genre: genre,
      year: year,
      price: price,
      pages: pages,
      language: language,
      translator: translator
    }
  end
end
