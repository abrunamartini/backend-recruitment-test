defmodule RecruitmentTestWeb.Router do
  use RecruitmentTestWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", RecruitmentTestWeb do
    pipe_through :api

    forward "/graphql", Absinthe.Plug, schema: RecruitmentTestWeb.Schema
    forward "/graphiql", Absinthe.Plug.GraphiQL, schema: RecruitmentTestWeb.Schema
  end
end
