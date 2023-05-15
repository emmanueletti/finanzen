# Finanzen

- [About](#about)
- [Development](#development)

## About

A privacy-focused, free and open-source financial management tool to help
Canadian households understand their money better.

The primary purpose of this project is to build a vanilla Rails application using as little additional libraries and gems as possible as a learning experience to better understand what goes on at the roots.

## Development

Make sure the foreman gem is globally installed

```bash
gem install foreman
```

To start the server with tailwind running in watch mode as well

```bash
bin/dev
```

To only run the rails server without tailwind running in watch mode.
This is important when trying to use `binding.pry`

```bash
rails server
```

This uses foreman to start both the Tailwind watch process and the rails server in development mode.
