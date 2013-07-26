# encoding: utf-8

namespace :rontgen do
  begin
    require 'rontgen/flog'

    desc 'Code complexity analysis'
    task :flog do
      flog = Rontgen::Flog.new
      threshold = flog.threshold
      results = flog.run!

      if results.any?
        max = results.last[1]
        abort "Adjust flog score down to #{max}" unless max >= threshold
      end

      bad_methods = results.select { |name, score| score > threshold }
      if bad_methods.any?
        bad_methods.reverse_each do |name, score|
          printf "%8.1f: %s\n", score, name
        end

        abort "#{bad_methods.size} methods have a flog complexity > #{threshold}"
      end
    end

  rescue LoadError
    puts '**In order to run flog, you must: gem install flog**'
  end
end
