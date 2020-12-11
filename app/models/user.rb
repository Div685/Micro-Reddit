class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || "is not an email")
    end
  end
end

class User < ApplicationRecord
	validates  :username, :email, presence: true, uniqueness: true
	validates  :username, length: { minimum: 3, maximum: 16 }
	validates  :email, email:true
	validates	 :password, length { minimum: 8 }
end
