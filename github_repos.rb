#!/usr/bin/env ruby

require 'git'
require 'yaml'
require 'octokit'
require 'colorize'

settings = YAML::load_file(File.join(__dir__, 'settings.yml'))

token = settings["github"]["token"]
login = settings["github"]["login"]

client = Octokit::Client.new(access_token: token)

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

repo_names = client.repos(login).map { |repo| repo.full_name }

exit 0 if repo_names.empty?

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
  r = Git.clone(repo[:ssh_url], repo[:name], :path => settings["github"]["path"], :recursive => true)
  r.add_remote('upstream', repo[:parent][:ssh_url]) if repo[:parent]
  # TODO: fetch repository
  print ".".green
end

puts "\nDone".bold

exit 0
