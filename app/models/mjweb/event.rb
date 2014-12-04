module Mjweb
  class Event < ActiveRecord::Base
    belongs_to :company

    validates :topic, :venue, :address, :postcode, presence: true

    validates :date,
      presence: true,
      format: { with: DATE_REGEXP, message: "please enter a valid date in the format dd/mm/yyyy" }

    validates :start, :finish,
      presence: true,
      format: { with: TIME_REGEXP, message: "please enter a time based on the 24 hour clock in the format hh:mm" }

  end
end
