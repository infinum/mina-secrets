require 'mina/bundler'
require 'mina/rails'

set :shared_files, fetch(:shared_files, []).push('config/application.yml')

namespace :secrets do
  set :term_mode, :pretty

  desc 'secrets policies'
  task :policies do
    comment 'Secrets policies'
    command 'secrets policies'
  end

  desc 'Secrets pull'
  task :pull do
    comment 'Secrets pull'
    command "secrets pull -e #{fetch(:rails_env)} -d #{fetch(:shared_path)} -y"
  end
end
