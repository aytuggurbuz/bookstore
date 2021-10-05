defmodule Bookstore.Storage.Base do
  defmacro __using__(_options) do
    quote do
      use Agent

      def start_link(_options) do
        Agent.start_link(fn -> Bookstore.Storage.Persistence.load(__MODULE__) end,
          name: __MODULE__
        )
      end

      def add(resource) do
        Agent.update(__MODULE__, fn state ->
          content = state ++ [resource]

          __MODULE__
          |> Bookstore.Storage.Persistence.persist(content)

          content
        end)
      end

      def update(%{id: resource_id} = resource, params) do
        case get(resource_id) do
          %{} = resource ->
            updated_resource = Map.merge(resource, params)

            Agent.update(__MODULE__, fn state ->
              without_resource =
                state
                |> Enum.reject(fn r ->
                  r.id == resource_id
                end)

              new_state = [updated_resource | without_resource]

              __MODULE__
              |> Bookstore.Storage.Persistence.persist(new_state)

              new_state
            end)

          nil ->
            {:error, :not_found}
        end
      end

      def delete(id) do
        case get(id) do
          %{} = resource ->
            Agent.update(__MODULE__, fn state ->
              without_resource =
                state
                |> Enum.reject(fn r ->
                  r.id == id
                end)

              __MODULE__
              |> Bookstore.Storage.Persistence.persist(without_resource)

              without_resource
            end)

          nil ->
            {:error, :not_found}
        end
      end

      def all do
        Agent.get(__MODULE__, fn state -> state end)
      end

      def get(id) do
        Agent.get(__MODULE__, fn state ->
          Enum.find(state, fn resource -> resource.id == id end)
        end)
      end

      def preload(resource) do
        preloaded =
          resource
          |> Map.from_struct()
          |> Enum.filter(fn {key, value} ->
            case value do
              %Bookstore.Storage.Association{} ->
                true

              _ ->
                false
            end
          end)
          |> Enum.map(fn {key, value} ->
            module = Module.safe_concat(value.module, Store)

            {key, module.get(value.resource_id)}
          end)
          |> Enum.into(%{})

        Map.merge(resource, preloaded)
      end
    end
  end
end
