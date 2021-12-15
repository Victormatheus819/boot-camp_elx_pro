# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Hydra.Repo.insert!(%Hydra.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
Hydra.Repo.insert!(%Hydra.Stores.Store{
  name: "Swap",
  description: "Swap e a maquina white label de criar fintechs em poucos dias",
  lat: -23.585289979339343,
  email: "abobora@123",
  lng: -46.67357717366849
})

Hydra.Repo.insert!(%Hydra.Stores.Store{
  name: "Sol Facil",
  description: "Solfaci e a plataforma tecnologica parafinanciamnetos feita para você",
  lat: -23.56495202388395,
  email: "abobora@123",
  lng: -46.69231000926914
})
