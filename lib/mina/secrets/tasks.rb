require 'mina/bundler'
require 'mina/rails'

namespace :secrets do
  set :term_mode, :pretty

  desc 'secrets auth'
  task auth: :environment do
    queue %(echo "-----> Secrets auth")
    queue! %(secrets auth #{verbose_mode? ? '-V' : ''})
  end

  desc 'Secrets pull'
  task pull: :environment do
    queue %(echo "-----> Secrets pull")
    queue! %(secrets pull -e #{rails_env} #{verbose_mode? ? '-V' : ''})
  end
end
