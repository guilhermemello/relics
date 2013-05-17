# coding: utf-8

class DatetimeValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    before_type_cast = "#{attribute}_before_type_cast"

    raw_value = record.send(before_type_cast) if record.respond_to?(before_type_cast.to_sym)
    raw_value ||= value

    #raw_value.gsub!("__/__/____", "") unless raw_value.nil?

    return if raw_value.blank?
    raw_value.to_datetime rescue record.errors[attribute] << (options[:message] || "informe uma fundação válida")
  end
end
