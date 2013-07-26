# encoding: utf-8

require 'rubocop'

module Rontgen
  class Rubocop
    CONFIG = 'rubocop.yml'.freeze

    def initialize
      @instance = ::Rubocop::CLI.new
    end

    def run!
      @instance.run(%W[--config #{Rontgen.project_metrics.join(CONFIG).to_s}])
    end
  end
end
