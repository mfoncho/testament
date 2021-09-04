defmodule Testament.DataType do

    use Ecto.Type
    alias Testament.Serializer

    def type, do: :binary

    def cast(data) when is_map(data) do
        {:ok, data}
    end

    def cast(_), do: :error

    def load(data) when is_binary(data) do
        Serializer.deserialize(data)
    end

    def dump(data) when is_map(data) do
        {:ok, Serializer.serialize(data)}
    end

    def dump(_), do: :error

end