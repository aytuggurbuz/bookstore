defmodule Bookstore.Places.Store do
  @enforce_keys [:id, :shelves, :clerks, :location]
  defstruct [:id, :shelves, :clerks, :location]

  defmodule Store do
    use Bookstore.Storage.Base
  end
  def new(%{
        shelves: shelves,
        clerks: clerks,
        location: location
      }) do
    %__MODULE__{
      id: UUID.uuid4(),
      shelves: shelves,
      clerks: clerks,
      location: location
    }
  end
end
