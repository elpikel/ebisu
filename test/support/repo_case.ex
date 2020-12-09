defmodule Ebisu.RepoCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      alias Ebisu.Repo

      import Ecto
      import Ecto.Query
      import Ebisu.RepoCase

      # and any other stuff
    end
  end

  setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Ebisu.Repo)

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(Ebisu.Repo, {:shared, self()})
    end

    :ok
  end
end
