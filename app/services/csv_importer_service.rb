# frozen_string_literal: true

class CsvImporterService
  FILE_ENCODING = 'iso-8859-1'
  CSV_HEADERS = %i[ año clave_ent entidad cve._municipio municipio
                    bien_jurídico_afectado tipo_de_delito subtipo_de_delito
                    modalidad enero febrero marzo abril mayo junio julio agosto
                    septiembre octubre noviembre diciembre ].freeze

  def self.call
    new.call
  end

  def call
    import_csv
  end

  private

  def import_csv
    Crime.transaction do
      Crime.delete_all

      SmarterCSV.process(CsvDownloaderService::FILE_PATH, options) do |chunk|
        chunk.each { |row| import_row(row) }
      end
    end
  end

  def options
    { file_encoding: FILE_ENCODING, key_mapping: header_translations }
  end

  def header_translations
    CSV_HEADERS.zip(Crime.column_names - %w[id updated_at created_at]).to_h
  end

  def import_row(row)
    return unless ['Tampico', 'Altamira', 'Ciudad Madero'].include?(row['city'])

    Crime.new(row).save(validate: false)
  end
end
