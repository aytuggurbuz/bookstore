defmodule Bookstore.Materials.Publisher do
  @derive Jason.Encoder
  @enforce_keys [:id, :name, :genres]
  defstruct [:id, :name, :genres]

  defmodule Store do
    use Bookstore.Storage.Base
  end

  def new(%{
        name: name,
        genres: genre
      }) do
    %__MODULE__{
      id: UUID.uuid4(),
      name: name,
      genres: genre
    }
  end
end
