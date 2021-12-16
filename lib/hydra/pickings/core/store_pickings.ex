 defmodule Hydra.Pickings.Core.StorePickings do
  alias Hydra.Repo
  alias Hydra.Stores.Store
   def store_pickings_into_mongo(%{"products" => products}) do
     # para cada Produto criar um evento de picking para cada store dentro do produto
      products
     |>build_payload_per_product()
     |>insert_into_mongo
     |>IO.inspect()
   end

   defp build_payload_per_product(products) do
     products
     |>IO.inspect()
     |> Enum.map(&build_payload_to_insert_into_mongo_per_store(&1["stores"], &1["product"]))
     |> List.flatten()
   end
   defp build_payload_to_insert_into_mongo_per_store(stores, product_name ) do
      IO.puts(stores)
      IO.puts(product_name)
      stores
      |> Enum.map(fn store_id ->
        store = Repo.get(Store, store_id)
        |>IO.inspect()
        %{
          store: %{
          id: store.id,
          description: store.description,
          name: store.name,
          lat: store.lat,
          lng: store.lng,
          },
          product: product_name ,
          delivered: false
        }
      end)
   end

   defp insert_into_mongo(products) do
    Enum.map(products,fn products ->
      Mongo.insert_one(:mongo,"orders",products)
    end)
   end
 end
