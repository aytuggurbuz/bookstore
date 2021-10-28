defmodule Bookstore.Places.Store do
  @derive Jason.Encoder
  @enforce_keys [:id, :shelves, :clerks, :location]
  defstruct [:id, :shelves, :clerks, :location]

  defmodule Store do
    use Bookstore.Storage.Base
  end

  alias Bookstore.Storage.Association

  def new(%{
        shelves: shelves,
        clerks: clerks,
        location: location
      }) do
    %__MODULE__{
      id: UUID.uuid4(),
      shelves: Association.new(shelves),
      clerks: Association.new(clerks),
      location: location
    }
  end
end
