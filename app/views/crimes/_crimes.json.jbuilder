# frozen_string_literal: true

json.pagination do
  json.page       crimes.current_page
  json.total      crimes.total_pages
  json.next_page  url_to_next_page crimes
end
json.crime_count crimes.except(:limit, :offset).year_count
json.content do
  json.array! crimes do |crime|
    json.year                  crime.year
    json.state                 crime.state
    json.city                  crime.city
    json.affected_legal_asset  crime.affected_legal_asset
    json.crime_type            crime.crime_type
    json.crime_subtype         crime.crime_subtype
    json.modality              crime.modality
    json.january_count         crime.january_count
    json.february_count        crime.february_count
    json.march_count           crime.march_count
    json.april_count           crime.april_count
    json.may_count             crime.may_count
    json.june_count            crime.june_count
    json.july_count            crime.july_count
    json.august_count          crime.august_count
    json.september_count       crime.september_count
    json.october_count         crime.october_count
    json.november_count        crime.november_count
    json.december_count        crime.december_count
  end
end
