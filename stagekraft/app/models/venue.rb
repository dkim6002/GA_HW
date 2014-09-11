class Venue
  include Mongoid::Document
  field :name, type: String
  field :city, type: String
  field :state, type: String
  field :country, type: String

  has_many :events
  has_and_belongs_to_many :artists

end
