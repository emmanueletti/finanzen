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

To start the rails server with tailwind running in watch mode:

```bash
bin/dev
```

This [uses foreman](https://github.com/rails/tailwindcss-rails#update-assets-automatically) to start both the Tailwind watch process and the rails server in development mode.


To only run the rails server without tailwind running in watch mode:

```bash
rails server
```

This is important when trying to use a debugger like `binding.pry`.
