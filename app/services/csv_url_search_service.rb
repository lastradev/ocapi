# frozen_string_literal: true

class CsvUrlSearchService
  URL = 'https://www.gob.mx/sesnsp/acciones-y-programas/datos-abiertos-de-incidencia-delictiva'
  CSV_ANCHOR_TAG_XPATH = '/html/body/main/div/div/div[3]/div/div/ul[1]/li[2]/a[1]'

  def self.call
    new.call
  end

  def call
    csv_url
  end

  private

  def csv_url
    document.xpath(CSV_ANCHOR_TAG_XPATH).first['href']
  end

  def document
    Nokogiri::HTML(http_response_body)
  end

  def http_response_body
    HTTParty.get(URL).body
  end
end
