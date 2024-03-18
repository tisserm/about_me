# frozen_string_literal: true

class DateCalculations
  def self.years_since(date)
    ((Date.today - date) / 365).floor
  end
end
