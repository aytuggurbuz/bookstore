defmodule Bookstore.People.Translator do
  @derive Jason.Encoder
  @enforce_keys [:id, :name, :age, :gender, :languages]
  defstruct [:id, :name, :age, :gender, :languages]

  defmodule Store do
    use Bookstore.Storage.Base
  end
  def new(%{
        name: name,
        age: age,
        gender: gender,
        languages: languages
      }) do
    %__MODULE__{
      id: UUID.uuid4(),
      name: name,
      age: age,
      gender: gender,
      languages: languages
    }
  end
end
