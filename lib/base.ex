defmodule Bandsintown.Base do
  defmacro __using__(_) do
    quote do
      use HTTPoison.Base

      defp process_response_body(body) do
        body
        |> Poison.decode!
      end

      defp process_url(url) do
        app_id = Application.fetch_env!(:bandsintown, :app_id)
        "http://api.bandsintown.com/" <> url <> "&api_version=2.0&app_id=#{app_id}"
      end
    end
  end
end
