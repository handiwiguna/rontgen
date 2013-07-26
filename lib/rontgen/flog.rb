# encoding: utf-8

require 'flog'
require 'flog_cli'

module Rontgen
  class Flog
    CONFIG = 'flog.yml'.freeze

    def initialize
      @config = YAML.load_file(Rontgen.project_metrics.join(CONFIG))
      @instance = ::Flog.new
    end

    def threshold
      @config.fetch('threshold')
    end

    def run!
      @instance.flog(*FlogCLI.expand_dirs_to_files(Rontgen.project_lib))
      @instance.totals.select  { |name, score| name[-5, 5] != '#none'  }
                      .map     { |name, score| [name, score.round(1)]  }
                      .sort_by { |name, score| score  }
    end
  end
end
