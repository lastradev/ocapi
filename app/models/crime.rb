# frozen_string_literal: true

class Crime < ApplicationRecord
  MONTHS_COUNTS = %i[
    january_count
    february_count
    march_count
    april_count
    may_count
    june_count
    july_count
    august_count
    september_count
    october_count
    november_count
    december_count
  ].freeze

  scope :robberies, -> { where("modality LIKE ?", "%con violencia%") }

  def self.year_count
    pluck(*MONTHS_COUNTS).flatten.compact.sum
  end
end
