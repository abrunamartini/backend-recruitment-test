defmodule RecruitmentTestWeb.SchemaTest do
  use RecruitmentTestWeb.ConnCase, async: true
  import RecruitmentTest.Factory 

  @mutation """
  mutation {
    createEnterprise(
      name: "Empresa Teste", 
      cnpj: "89.998.935/0001-12", 
      commercialName: "Teste LTDA", 
      description: "Empresa de Teste"
    ) {
      id
      name
      commercialName
      cnpj
      description
    }
  }
  """

  @query """
  query {
    enterprises {
      id
      name
      commercialName
      cnpj
      description
    }
  }
  """
  @tag :skip
  test "Create and List Enterprises", %{conn: conn} do
    post(conn, "/api/graphql", %{query: @mutation})

    conn = post(conn, "/api/graphql", %{query: @query})

    assert json_response(conn, 200) == %{
      "data" => %{
        "enterprises" => [
          %{
            "name" => "Empresa Teste",
            "commercialName" => "Teste LTDA",
            "cnpj" => "89.998.935/0001-12",
            "description" => "Empresa de Teste"
          }
        ]
      }
    }
  end
end
