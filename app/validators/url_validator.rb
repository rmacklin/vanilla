class UrlValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    valid = begin
      # The following matches on http:/google.com so we add a little more.
      URI.parse(value).kind_of?(URI::HTTP) && value.include?('://')
    rescue URI::InvalidURIError
      false
    end
    unless valid
      record.errors[attribute] << (options[:message] || "is an invalid URL")
    end
  end

end
