defmodule Backend.Services.Index do
  alias Backend.{Repo, Services}
  import Ecto.Query

  @default_pages_size 10

  def call(%{"q" => page, "f" => page_size}) do
    Services
    |> order_by(asc: :name)
    |> preload(:users)
    |> Repo.paginate(page: page, page_size: page_size)
    |> return_test(page)
  end

  def call(%{"q" => page}) do
    Services
    |> order_by(asc: :name)
    |> preload(:users)
    |> Repo.paginate(page: page, page_size: @default_pages_size)
  end

  def call(%{"f" => page_size}) do
    Services
    |> order_by(asc: :name)
    |> preload(:users)
    |> Repo.paginate(page: 1, page_size: page_size)
  end

  def call(_params) do
    Services
    |> order_by(asc: :name)
    |> preload(:users)
    |> Repo.paginate(page: 1, page_size: @default_pages_size)
  end

  defp return_test(%Scrivener.Page{ total_pages: total_page_number} = page, page_number)do
    {page_number, _float} = Integer.parse(page_number)

    if(page_number >= total_page_number)do
      {:error, :true}
    else
      page
    end
  end

end
