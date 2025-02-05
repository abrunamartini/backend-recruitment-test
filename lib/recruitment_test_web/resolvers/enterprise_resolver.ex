defmodule RecruitmentTestWeb.Resolvers.EnterpriseResolver do
  alias RecruitmentTest.Repo
  alias RecruitmentTest.Enterprises.Enterprise

  def list(_, _, _) do
    {:ok, Repo.all(Enterprise)}
  end

  def get(_, %{id: id}, _) do
    case Repo.get(Enterprise, id) do
      nil -> {:error, "Enterprise not found"}
      enterprise -> {:ok, enterprise}
    end
  end

  def create(_, args, _) do
    %Enterprise{}
    |> Enterprise.changeset(args)
    |> Repo.insert()
  end

  def update(_, %{id: id} = args, _) do
    case Repo.get(Enterprise, id) do
      nil -> {:error, "Enterprise not found"}
      enterprise ->
        enterprise
        |> Enterprise.changeset(args)
        |> Repo.update()
    end
  end

  def delete(_, %{id: id}, _) do
    case Repo.get(Enterprise, id) do
      nil -> {:error, "Enterprise not found"}
      enterprise -> Repo.delete(enterprise)
    end
  end
end
