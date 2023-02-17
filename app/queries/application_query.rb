# frozen_string_literal: true

class ApplicationQuery
  include Statinize

  def self.query(params)
    new(params).query
  end
end
