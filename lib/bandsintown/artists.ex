defmodule Bandsintown.Artists do
  use Bandsintown.Base

  def get(params \\ [artist: nil, artist_id: nil]) do
    get!("artists/#{artist(params)}.json?").body
  end

  @doc """
  date can be:
    yyyy-mm-dd
    yyyy-mm-dd,yyyy-mm-dd (inclusive range)
    upcoming
    all
  """
  def events(params \\ [artist: nil, artist_id: nil, date: "", extended: false]) do
    get!("artists/#{artist(params)}/events.json?extended=#{params[:extended]}&date=#{params[:date]}").body
  end

  @doc """
  date can be:
    yyyy-mm-dd
    yyyy-mm-dd,yyyy-mm-dd (inclusive range)
    upcoming
    all

  location can be:
    city,state (US or CA)
    city,country
    lat,lon
    ip address
    use_geoip (will use the ip the request came from)
  """
  def event_search(params \\ [artist: nil, artist_id: nil, date: "", radius: 25, location: ""]) do
    get!("artists/#{artist(params)}/events/search.json?date=#{date(params)}&radius=#{params[:radius]}&location=#{location(params)}").body
  end

  @doc """
  only_recs (boolean) - If true, the response will only include matching events for artists similar to the specified artist. if false, the response may also include matching events for the specified artist.
  """
  def recommended_events(params \\ [artist: nil, artist_id: nil, date: "", radius: 25, location: "", only_recs: false]) do
    get!("artists/#{artist(params)}/events/recommended.json?date=#{date(params)}&radius=#{params[:radius]}&location=#{location(params)}&only_recs=#{params[:only_recs]}").body
  end

  defp artist(params) do
    URI.encode(params[:artist] || params[:artist_id])
  end

  defp date(params) do
    URI.encode(params[:date] || "")
  end

  defp location(params) do
    URI.encode(params[:location] || "")
  end
end
