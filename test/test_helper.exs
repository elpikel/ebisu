ExUnit.start()

Ecto.Adapters.SQL.Sandbox.mode(Ebisu.Repo, :manual)

Mox.defmock(Ebisu.Utils.MockHttp, for: Ebisu.Utils.Http)
