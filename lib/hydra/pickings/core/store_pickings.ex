 defmodule Hydra.Pickings.Core.StorePickings do
  alias Hydra.Repo
  alias Hydra.Stores.Store
   def store_pickings_into_mongo(%{"products" => products}) do
     # para cada Produto criar um evento de picking para cada store dentro do produto
      products
     |>build_payload_per_product()
     |>IO.inspect()
   end

   defp build_payload_per_product(products) do
     products
     |> Enum.map(&build_payload_to_insert_into_mongo_per_store(&1["stores"],&1["product"]))
     |> List.flatten()
   end
   defp build_payload_to_insert_into_mongo_per_store(stores,product_name) do
      stores
      |> Enum.map(fn store_id->
        store = Repo.get(Store,store_id)

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
 end
