defmodule Bookstore.People.Clerk do
  @derive Jason.Encoder
  @enforce_keys [:id, :name, :age, :gender, :shelves]
  defstruct [:id, :name, :age, :gender, :shelves]

  defmodule Store do
    use Bookstore.Storage.Base
  end

  alias Bookstore.Storage.Association

  def new(%{
        name: name,
        age: age,
        gender: gender,
        shelves: shelves
      }) do
    %__MODULE__{
      id: UUID.uuid4(),
      name: name,
      age: age,
      gender: gender,
      shelves: Association.new(shelves)
    }
  end
end
