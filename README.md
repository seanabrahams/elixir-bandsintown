# Bandsintown

Elixir library for [bandsintown.com's V2 API](https://www.bandsintown.com/api/overview).

This library is open source (MIT License) and welcomes contributions!

## Installation

1. Add bandsintown to your list of dependencies in `mix.exs`:

```elixir
  def deps do
    [{:bandsintown, git: "https://github.com/seanabrahams/elixir-bandsintown.git"}]
  end
```

```elixir
  config :bandsintown,
    app_id: "Your Bandsintown App ID"
```

## Usage

```elixir
Bandsintown.Artists.get(artist: "radiohead")
Bandsintown.Artists.events(artist: "radiohead", date: "2017-01-01")
Bandsintown.Artists.events_search(artist: "radiohead", location: "San Francisco, CA", date: "2017-01-01")
Bandsintown.Artists.recommended_events(artist: "radiohead", location: "San Francisco, CA", date: "2017-01-01")
```
