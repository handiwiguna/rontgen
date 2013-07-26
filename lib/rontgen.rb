# encoding: utf-8

require 'rontgen/version'
require 'rake'
require 'pathname'

module Rontgen

  def self.root
    Pathname('../../').expand_path(__FILE__)
  end

  def self.project_root
    Pathname.pwd
  end

  def self.gemfile_template
    root.join('template/Gemfile')
  end

  def self.project_gemfile
    project_root.join('Gemfile.dev')
  end

  def self.project_metrics
    project_root.join('metrics')
  end

  def self.project_lib
    project_root.join('lib')
  end

  def self.load_tasks
    FileList[root.join('tasks/**/*.rake').to_s].each { |task| load(task) }
  end

end
