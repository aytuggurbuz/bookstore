defmodule Bookstore.People.Author do
  @derive Jason.Encoder
  @enforce_keys [:id, :name, :age, :gender, :genre]
  defstruct [:id, :name, :age, :gender, :genre]

  defmodule Store do
    use Bookstore.Storage.Base
  end

  def new(%{
        name: name,
        age: age,
        gender: gender,
        genre: genre
      }) do
    %__MODULE__{
      id: UUID.uuid4(),
      name: name,
      age: age,
      gender: gender,
      genre: genre
    }
  end
end
