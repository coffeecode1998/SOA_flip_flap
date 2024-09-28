# frozen_string_literal: true

module TsvBuddy
  # Converts a String with TSV data into internal data structure @data
  # arguments: tsv - a String in TSV format
  # returns: Array of Hashes
  def take_tsv(tsv)
    rows = tsv.split("\n")
    # /puts rows
    headers = rows.shift.split("\t")
    # puts headers

    @data = rows.map do |line|
      row = line.split("\t")
      headers.zip(row).to_h
    end
    # puts @data[-1]["date"]
  end

  # Converts @data into tsv string
  # arguments: none
  # returns: String in TSV format
  def to_tsv
 
    headers = @data[0].keys
    tsv_string = headers.join("\t") + "\n"

    @data.each do |item|
      line = headers.map { |header| item[header].to_s }
      tsv_string << line.join("\t") + "\n"
    end

    tsv_string
  end
end
