require 'capistrano_colors'
require "bundler/capistrano"

# RVMを利用している場合は必要
#$:.unshift(File.expand_path('./lib', ENV['rvm_path']))
#require 'rvm/capistrano'
#set :rvm_ruby_string, '1.9.2@dm'
set :user, 'rackhuber'
set :port, 50013
#set :rvm_type, :user

# リポジトリの設定
set :application, "cutend"
set :scm, :git
set :repository, "git@github.com:asonas/24contest.git"
set :branch, "master" #devブランチ切ったら変更すること
set :deploy_via, :remote_cache
set :deploy_to, "/home/rackhuber/#{application}"
set :rails_env, "development"

role :web, "asonas.rackbox.net"
# Your HTTP server, Apache/etc
role :app, "asonas.rackbox.net"
# This may be the same as your `Web` server
role :db,  "asonas.rackbox.net", :primary => true
# This is where Rails migrations will run
