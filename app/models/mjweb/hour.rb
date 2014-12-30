module Mjweb
  class Hour < ActiveRecord::Base
    
    #relationship with model in main app
    belongs_to :company

    validates :monday_open, :monday_close, :tuesday_open, :tuesday_close, :wednesday_open, :wednesday_close, :thursday_open, :thursday_close, :friday_open, :friday_close, :saturday_open, :saturday_close, :sunday_open, :sunday_close,
      presence: true,
      format: { with: TIME_REGEXP, message: "please enter a time based on the 24 hour clock in the format hh:mm" }


  end
end
