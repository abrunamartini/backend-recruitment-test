defmodule RecruitmentTest.Factory do
  use ExMachina.Ecto, repo: RecruitmentTest.Repo

  def enterprise_factory do
    %RecruitmentTest.Enterprises.Enterprise{
      name: sequence(:name, &"Enterprise #{&1}"),
      commercial_name: sequence(:commercial_name, &"Nome comercial #{&1}"),
      cnpj: sequence(:cnpj, &"12.345.678/000#{&1}-90"),
      description: "Empresa de software embarcado"
    }
  end

  def employee_factory do
    %RecruitmentTest.Enterprises.Employee{
      id: Ecto.UUID.generate(),
      name: sequence(:name, &"Funcionario #{&1}"),
      position: sequence(:position, &"Cargo #{&1}"),
      enterprise: build(:enterprise)
    }
  end
end
