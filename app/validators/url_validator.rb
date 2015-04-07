class UrlValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if !value.blank?
      record.errors[attribute] << "must begin with http:// or https://" unless 
      value.match(/^https?:\/\//)
    end
  end
end
