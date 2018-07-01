#!/usr/bin/env ruby

require 'git'
require 'yaml'
require 'octokit'
require 'ostruct'
require 'colorize'

data = YAML::load_file(File.join(__dir__, "settings.yml"))
settings = OpenStruct.new(data['github']) if data.key?('github')

client = Octokit::Client.new(access_token: settings.token)
rate = client.rate_limit

puts <<-MSG
=======================================
Rate Limit Status:
    limit   = #{rate.limit} calls
    current = #{rate.remaining} calls
    reset   = #{rate.resets_in} seconds
=======================================
MSG

puts "Downloading"

repos = client.repositories(:visibility => "all")
repo_names = repos.any? { |repo| repo.key?(:full_name) } ? repos.map(&:full_name) : []

repos = repo_names.map do |repo|
          repo = client.repository(repo)
          repo = {
            :name => repo.name,
            :full_name => repo.full_name,
            :ssh_url => repo.ssh_url,
            :parent => if repo.parent
                         {
                           :name => repo.parent.name,
                           :full_name => repo.parent.full_name,
                           :ssh_url => repo.parent.ssh_url
                         }
                       else
                        nil
                       end
          }
          print ".".green
          repo
        end

puts "\nCloning"

repos.each do |repo|
  if File.directory?(dir = File.join(settings.path, repos.first[:name]))
    print "\n#{dir} already exists, skipping\n"
    next
  end
  r = Git.clone(repo[:ssh_url], repo[:name], :path => settings.path, :recursive => true)
  r.add_remote('upstream', repo[:parent][:ssh_url]) if repo[:parent]
  r.remotes.each { |remote| r.remote(remote).fetch }
  if repo[:parent]
    r.branch('master').checkout
    r.merge('upstream/master')
    r.push
  end
  print ".".green
end

puts "\nDone".bold

exit(0)
