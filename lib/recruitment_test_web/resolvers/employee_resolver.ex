defmodule RecruitmentTestWeb.Resolvers.EmployeeResolver do
  alias RecruitmentTest.Repo
  alias RecruitmentTest.Enterprises.Employee

  def create(_, args, _) do
    %Employee{}
    |> Employee.changeset(args)
    |> Repo.insert()
  end
end
