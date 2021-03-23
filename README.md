# Another Phoenix Trello
This Project cloned from https://github.com/bigardone/phoenix-trello
also only upgrade Phoenix version to latest version(1.5.7),
want to try liveview, so this is the first step.🐶

## Requirements
You need to have **Elixir v1.3** and **PostgreSQL** installed.

## Installation instructions
To start your Phoenix Trello app:

  1. Install dependencies with `mix deps.get`
  2. Install npm packages with `yarn`
  3. Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  4. Run seeds to create demo user with `mix run priv/repo/seeds.exs`
  5. Start Phoenix endpoint with `mix phoenix.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Enjoy!

## Testing
Integration tests with [Hound](https://github.com/HashNuke/hound) and [Selenium ChromeDriver](https://github.com/SeleniumHQ/selenium/wiki/ChromeDriver). Instructions:

  1. Install **ChromeDriver** with `yarn -g chromedriver`
  2. Run **ChromeDriver** in a new terminal window with `chromedriver &`
  3. Run tests with `mix test`

If you don't want to run integration tests just run `mix test --exclude integration`.

## License

The MIT License.