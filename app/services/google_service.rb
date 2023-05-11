# frozen_string_literal: true

class GoogleService
  attr_reader :session, :worksheet, :title_columns

  def initialize(spreadsheet_key, title)
    @session = GoogleDrive::Session.from_service_account_key('google_config.json')
    @worksheet = @session.spreadsheet_by_key(spreadsheet_key).worksheets.find { |item| item.title == title }
    @title_columns = get_row(2)
  end

  def get_row(row)
    (1..worksheet.num_cols).map do |col|
      worksheet[row, col]
    end
  end

  def self.worksheet
    new('19X-mW4W5x54MkvuhIiavLhg113cX-ZvBszLm6My47WA', 'The List')
  end

  def get_column_by_name(column_name)
    title_columns.index(column_name) + 1
  end

  def self.column_names
    {
      year: 'YEAR',
      special_event: "OLYMPICS/\nSPECIAL",
      item_number: 'ITEM #',
      item_number_addendum: 'Disambiguation Addendum',
      original_item: "ITEM TEXT (sic)\n(make edits here to make this text reflect **precisely** the original formatting given on The List, as closely as possible)",
      spellchecked_item: "STANDARDIZED, SEARCHABLE (SPELL-CHECKED) TEXT\n(make edits here to fix typos present in the original list)",
      points: 'Points (as written)',
      point_value: 'Points (Value)',
      comment: "ADDITIONAL CONTEXT\n(answers, TBAs, notes)",
      rating: 'NOT SAFE FOR PUBLIC (NSFP) - IF TAGGED, WILL NOT PULL FOR PUBLIC FACING USES (WILL ONLY SHOW UP IN DIRECT QUERY)'
    }
  end

  def column_indexes
    columns = {}
    self.class.column_names.each { |key, val| columns[key] = get_column_by_name(val) }
    columns
  end

  def row_to_item_hash(row)
    item = {}
    column_indexes.each { |key, column| item[key] = row[column - 1] }
    item
  end
end
