class UrlValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    uri = URI.parse(value)
    unless uri.kind_of?(URI::HTTP)
      record.errors[attribute] << 'invalid format' 
    end
  end
end
