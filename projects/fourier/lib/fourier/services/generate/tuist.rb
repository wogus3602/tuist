# frozen_string_literal: true

require 'json'

module Fourier
  module Services
    module Generate
      class Tuist < Base
        attr_reader :open

        def initialize(open: false)
          @open = open
        end

        def call
          dependencies = ["dependencies", "fetch"]
          Utilities::System.tuist(*dependencies)

          dump = JSON.parse(Utilities::System.tuist(["dump"]))
          targets = dump["targets"].map { |item| item["name"] }

          cache = ["cache", "warm", "--dependencies-only", targets]
          Utilities::System.tuist(*cache)

          focus = ["focus", targets]
          focus << "--no-open" if !open
          Utilities::System.tuist(*focus)
        end
      end
    end
  end
end
