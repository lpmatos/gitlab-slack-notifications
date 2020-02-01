# Rakefile

# Default taks.
task :default => :helper

# Simple Taks.
task :helper do
    puts "This is just a Helper Task... If you need other thing, please, check the documentation."
end

# This is the namespace Block.
namespace :main do
    # A short description about the task.
    desc "Base Rakefile to Ruby."
    # The task block.
    task :install do
        puts "Installing packages..."
        `bundle install`
    end
end
