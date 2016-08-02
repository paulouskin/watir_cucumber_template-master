require 'rubygems'
require 'cucumber'
require 'cucumber/rake/task'

Cucumber::Rake::Task.new(:features) do |t|
  t.profile = 'default'
end

task :run_with_tags, [:arg1] do |t, args|
  Cucumber::Rake::Task.new(:tags) do |t|
    t.profile = 'default'
    t.cucumber_opts = "--tags @#{args[:arg1]}"
  end
  Rake::Task[:tags].invoke()
end

task :default => :features