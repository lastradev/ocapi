# frozen_string_literal: true

class CrimesController < ApplicationController
  def index
    @crimes = crimes
  end

  def robberies
    @robberies = crimes.robberies
  end

  def download
    send_file(
      CsvDownloaderService::FILE_PATH,
      filename: CsvDownloaderService::FILE_NAME,
      type: CsvDownloaderService::FILE_TYPE
    )
  end

  private

  def crime_params
    params.except(:page, :format).permit(%i[year city affected_legal_asset crime_type crime_subtype modality])
  end

  def crimes
    Crime.where(crime_params).page(params[:page])
  end
end
