defmodule RecruitmentTestWeb.Schema do
  use Absinthe.Schema
  import_types(RecruitmentTestWeb.Schema.ContentTypes)

  alias RecruitmentTestWeb.Resolvers
  alias RecruitmentTestWeb.Resolvers.EnterpriseResolver
  alias RecruitmentTestWeb.Resolvers.EmployeeResolver

  object :enterprise do
    field :id, non_null(:id)
    field :name, non_null(:string)
    field :commercial_name, non_null(:string)
    field :cnpj, non_null(:string)
    field :description, :string
  end

  object :employee do
    field :id, non_null(:id)
    field :name, :string
    field :position, :string
    field :enterprise_id, :id
  end

  query do
    @desc "Returns a Hello World message"
    field :hello_world, :string do
      resolve(&Resolvers.HelloWorld.get/3)
    end

    @desc "List enterprises"
    field :enterprises, list_of(:enterprise) do
      resolve &EnterpriseResolver.list/3
    end

    @desc "Search enterprise by ID"
    field :enterprise, :enterprise do
      arg :id, non_null(:id)
      resolve &EnterpriseResolver.get/3
    end
  end


  mutation do
    field :create_enterprise, :enterprise do
      arg :name, non_null(:string)
      arg :commercial_name, non_null(:string)
      arg :cnpj, non_null(:string)
      arg :description, :string
      resolve &EnterpriseResolver.create/3
    end

    field :update_enterprise, :enterprise do
      arg :id, non_null(:id)
      arg :name, :string
      arg :commercial_name, :string
      arg :cnpj, :string
      arg :description, :string
      resolve &EnterpriseResolver.update/3
    end

    field :delete_enterprise, :enterprise do
      arg :id, non_null(:id)
      resolve &EnterpriseResolver.delete/3
    end

    field :create_employee, :employee do
      arg :name, non_null(:string)
      arg :position, non_null(:string)
      arg :enterprise_id, non_null(:id)
      resolve &EmployeeResolver.create/3
    end
  end
end
