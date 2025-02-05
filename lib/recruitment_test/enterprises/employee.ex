defmodule RecruitmentTest.Enterprises.Employee do
    use RecruitmentTest.Schema

    import Ecto.Changeset

    schema "employees" do
        field :name, :string
        field :position, :string
        belongs_to :enterprise, RecruitmentTest.Enterprises.Enterprise

        timestamps()
    end

    def changeset(employee, attrs) do
        employee
        |> cast(attrs, [:name, :position, :enterprise_id])
        |> validate_required([:name, :position, :enterprise_id])
    end
end
