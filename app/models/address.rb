class Address < ActiveRecord::Base
  belongs_to :contact
  # validates :street, :city, :state, :zip presence: true
end
