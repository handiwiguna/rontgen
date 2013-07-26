# encoding: utf-8

require 'pathname'

namespace :rontgen do
  desc 'Update Gemfile.dev'
  task :gemfile do
    cp Rontgen.gemfile_template, Rontgen.project_gemfile
  end

  desc 'Copy default config for analysis'
  task :config do
    cp_r Rontgen.root.join('template/metrics'), Rontgen.project_root
  end
end
