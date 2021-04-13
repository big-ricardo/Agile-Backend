defmodule Backend.Establishments.Index do
  alias Backend.{Repo, Establishments}

  def call(%{"lat"=> lat, "lgn"=> lgn}) do
    geom =  %Geo.Point{coordinates: { lat, lgn}, srid: 4326}
    radius_in_miles= 4

    query =
      [
        "SELECT * FROM establishments",
        "WHERE ST_DWithin( establishments.point::geography, $1::geography,  $2)"
      ]
      |> Enum.join(" ")

    # The arguments we are passing to the query
    args = [geom, miles_to_meters(radius_in_miles)]

    case Repo.query(query, args, log: true) do
      {:ok, %Postgrex.Result{columns: cols, rows: rows}} ->
          result = Enum.map(rows, fn row ->
            Repo.load(Establishments, {cols, row})
          end)

          {:ok, result}
      _ ->
        {:error, :not_found}
    end
  end

  def call(%{"zip_code"=> zip_code})do
    query =
      [
        "SELECT * FROM establishments",
        "WHERE zip_code = $1::varchar"
      ]
      |> Enum.join(" ")

    case Repo.query(query, [zip_code], log: true) do
      {:ok, %Postgrex.Result{columns: cols, rows: rows}} ->
          result = Enum.map(rows, fn row ->
            Repo.load(Establishments, {cols, row})
          end)

          {:ok, result}
      _ ->
        {:error, :not_found}
    end
  end

  def call(_params)do
    Repo.all(Establishments)
    {:ok, Repo.all(Establishments)}
  end

  defp miles_to_meters(miles), do: miles * 1609.344

end
