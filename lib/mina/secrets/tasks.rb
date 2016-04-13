require 'mina/bundler'
require 'mina/rails'

namespace :secrets do
  set :term_mode, :pretty

  desc 'secrets policies'
  task policies: :environment do
    queue %(echo "-----> Secrets policies")
    queue! %(secrets policies #{verbose_mode? ? '-V' : ''})
  end

  desc 'secrets setup'
  task setup: :environment do
    queue %(echo "-----> Secrets setup")
    queue! %(mkdir -p #{shared_path}/config)
    queue! %(touch #{shared_path}/config/application.yml)
  end

  desc 'Secrets pull'
  task pull: :environment do
    queue %(echo "-----> Secrets pull")
    queue! %(secrets pull -e #{rails_env} -d #{deploy_to}/#{shared_path} #{verbose_mode? ? '-V' : ''})
  end
end
