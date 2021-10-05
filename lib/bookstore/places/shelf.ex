defmodule Bookstore.Places.Shelf do
  @derive Jason.Encoder
  @enforce_keys [:id, :genres]
  defstruct [:id, :genres]

  defmodule Store do
    use Bookstore.Storage.Base
  end

  alias Bookstore.Storage.Association
  def new(%{
        genres: genres
      }) do
    %__MODULE__{
      id: UUID.uuid4(),
      genres: Association.new(genres)
    }
  end
end
