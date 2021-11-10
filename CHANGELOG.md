# mina-secrets Change Log

All notable changes to this project will be documented in this file.

## 2.1.0 (2020-04-24)

* Fixed: bundle_prefix was called, instead of passing it as a symbol to `#fetch`

## 2.0.0 (2019-12-04)

* Breaking change: `secrets:pull` command uses `secrets_cli` from Gemfile. Add it in case you don't have it already. Also, make sure to change the order of commands in deploy.rb scripts, so `secrets:pull` command is after `bundle:install`

## 1.3.0 (2018-01-29)

* Removed: environments from `pull` and `policies` tasks
