# frozen_string_literal: true

require 'dotenv/tasks'

namespace :crimes do
  desc 'Synchronizes the crimes database'
  task sync: [:environment, :download, :import]

  desc 'Downloads the crimes CSV'
  task download: :environment do
    CsvDownloaderService.call
  end

  desc 'Imports the crimes CSV to the database'
  task import: :environment do
    CsvImporterService.call
  end
end
