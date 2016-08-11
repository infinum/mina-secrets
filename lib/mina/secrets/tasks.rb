require 'mina/bundler'
require 'mina/rails'

set :shared_dirs, fetch(:shared_dirs, []).push('config')
set :shared_files, fetch(:shared_files, []).push('config/application.yml')

namespace :secrets do
  set :term_mode, :pretty

  desc 'secrets policies'
  task policies: :environment do
    comment 'Secrets policies'
    command 'secrets policies'
  end

  # desc 'secrets setup'
  # task setup: :environment do
  #   comment 'Secrets setup'
  #   command "mkdir -p #{fetch(:shared_path)}/config"
  #   command "touch #{fetch(:shared_path)}/config/application.yml"
  # end

  desc 'Secrets pull'
  task pull: :environment do
    comment 'Secrets pull'
    command "secrets pull -e #{fetch(:rails_env)} -d #{fetch(:shared_path)}"
  end
end
