# frozen_string_literal: true

require 'test_helper'

class CrimeTest < ActiveSupport::TestCase
  test 'should count total crimes in a year' do
    count = Crime.where(year: 2020).year_count
    assert_equal 24, count
  end

  test 'should obtain all robberies' do
    robberies = Crime.robberies
    assert_equal 2, robberies.count
    assert(robberies.all? { |robbery| robbery.crime_type.include?('Robo') })
    assert(robberies.all? { |robbery| robbery.modality.include?('Con violencia') })
  end
end
