# /config/schedule.rb
set :environment, :development
set :output, 'log/crontab.log'

# Testなので、3分毎に動作するように設定します
every 3.minute do
  # cronのコマンドライン上で動くので、二重引用符で囲っておきます
  runner "Rakuten.rb"
  runner "Amazon.rb"
end

# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
