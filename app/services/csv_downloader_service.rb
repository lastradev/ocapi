# frozen_string_literal: true

class CsvDownloaderService
  FILE_NAME = 'crimes.csv'
  FILE_PATH = "tmp/#{FILE_NAME}".freeze
  FILE_TYPE = 'text/csv'
  FILE_ID_REGEX = /[-\w]{25,}(?!.*[-\w]{25,})/
  GDRIVE_API_URL_TEMPLATE = 'https://www.googleapis.com/drive/v3/files/%<file_id>s?key=%<api_key>s&alt=media'

  def self.call
    new.call
  end

  def call
    download_file
  end

  private

  def download_file
    File.open(FILE_PATH, 'w') do |file|
      file.binmode
      HTTParty.get(api_csv_download_url, stream_body: true) do |fragment|
        file.write(fragment)
      end
    end
  end

  def api_csv_download_url
    format(
      GDRIVE_API_URL_TEMPLATE,
      file_id:,
      api_key: ENV.fetch('GDRIVE_API_KEY')
    )
  end

  def file_id
    csv_gdrive_url.match(FILE_ID_REGEX)[0]
  end

  def csv_gdrive_url
    CsvUrlSearchService.call
  end
end
