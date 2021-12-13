defmodule HydraWeb.Router do
  use HydraWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", HydraWeb do
    pipe_through :api
  end
  scope "/", HydraWeb do
    foward "graphql", Absinte.Plug, schema: HydraGraphql.Schema, json_code: Jason
  end
end
