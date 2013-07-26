# encoding: utf-8

namespace :rontgen do
  begin
    require 'rontgen/rubocop'

    desc 'Checking code style'
    task :rubocop do
      begin
        rubocop = Rontgen::Rubocop.new
        rubocop.run!
      rescue Encoding::CompatibilityError => exception
        puts exception.message
      end
    end

  rescue LoadError
    puts '**In order to run rubocop, you must: gem install rubocop**'
  end
end
