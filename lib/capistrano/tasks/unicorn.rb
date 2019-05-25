# rubocop:disable Metrics/BlockLength
namespace :unicorn do
  task :environment do
    set :unicorn_pid,    "#{current_path}/tmp/pids/unicorn.pid"
    set :unicorn_config, "#{current_path}/config/unicorn/production.rb"
  end

  # start unicorn
  def start_unicorn
    within current_path do
      execute :bundle, :exec, :unicorn, "-c #{fetch(:unicorn_config)} -E #{fetch(:rails_env)} -D"
    end
  end

  # stop unicorn
  def stop_unicorn
    execute :kill, "-s QUIT $(< #{fetch(:unicorn_pid)})"
  end

  # restart unicorn
  def reload_unicorn
    execute :kill, "-s USR2 $(< #{fetch(:unicorn_pid)})"
  end

  # force stop unicron
  def force_stop_unicorn
    execute :kill, "$(< #{fetch(:unicorn_pid)})"
  end

  # task for start unicorn
  desc 'Start unicorn server'
  task start: :environment do
    on roles(:app) do
      start_unicorn
    end
  end

  # task for stop unicorn
  desc 'Stop unicorn server gracefully'
  task stop: :environment do
    on roles(:app) do
      stop_unicorn
    end
  end

  # task for restart or start unicorn
  desc 'Restart unicorn server gracefully'
  task restart: :environment do
    on roles(:app) do
      if test("[ -f #{fetch(:unicorn_pid)} ]")
        reload_unicorn
      else
        start_unicorn
      end
    end
  end

  # task for force stop unicorn
  desc 'Stop unicorn server immediately'
  task force_stop: :environment do
    on roles(:app) do
      force_stop_unicorn
    end
  end
end
# rubocop:enable Metrics/BlockLength
