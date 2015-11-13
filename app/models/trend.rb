class Trend < ActiveRecord::Base
  VALID_EMAIL_REGEX = /[!-@≠\[-`{-~０-９]/
  validates :noun, format: {without: VALID_EMAIL_REGEX}

  def create(username, key, value)
    Trend.create!(username: username, noun: key, count: value)
  rescue ActiveRecord::RecordInvalid => e
    pp e.record.errors
  end
end
