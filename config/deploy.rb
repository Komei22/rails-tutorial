# config valid only for current version of Capistrano
lock "3.9.0"

set :application, "sample_app"
set :repo_url, "https://github.com/Komei22/sample_app.git"
set :branch, "cap-start-puma"
set :rails_env, 'production'

task :start do
  on roles(:web) do
    execute "systemctl start puma"
  end
end

task :stop do
  on roles(:web) do
    execute "systemctl stop puma"
  end
end

task :restart do
  on roles(:web) do
    execute "cd /var/www/sample_app/current/ && bundle exec pumactl restart"
  end
end
