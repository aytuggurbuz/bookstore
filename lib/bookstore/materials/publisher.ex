defmodule Bookstore.Materials.Publisher do
  @derive Jason.Encoder
  @enforce_keys [:id, :name, :genres]
  defstruct [:id, :name, :genres]

  defmodule Store do
    use Bookstore.Storage.Base
  end

  alias Bookstore.Storage.Association

  def new(%{
        name: name,
        genres: genres
      }) do
    %__MODULE__{
      id: UUID.uuid4(),
      name: name,
      genres: Association.new(genres)
    }
  end
end
