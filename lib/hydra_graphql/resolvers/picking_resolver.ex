defmodule HydraGraphql.Resolvers.PickingResolver do
  alias Hydra.Pickings

  def create_picking(_parent, params,_resolution)do
    IO.inspect params
  #     %{
  #   products: [
  #     %{product: "123", stores: ["123", "123123"]},
  #     %{product: "123", stores: ["123", "123123"]}
  #   ]
  # }
 Task.async(fn ->Pickings.create_picking(params) end)
    {:ok,"We received the payload ,and we are going to create all orders !"}
  end
end
