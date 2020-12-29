defmodule Ebisu.Utils.Http do
  @timeout 5000

  def get(url) do
    case HTTPoison.get(url, [{"content-type", "application/json"}], recv_timeout: @timeout) do
      {:ok, %HTTPoison.Response{body: body, status_code: 200}} ->
        Jason.decode!(body)

      {:ok, %HTTPoison.Response{body: body}} ->
        {:error, body}

      {:error, %HTTPoison.Error{reason: reason}} ->
        {:error, reason}
    end
  end
end
