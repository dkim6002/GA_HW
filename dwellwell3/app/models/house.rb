class House
  include Mongoid::Document
  field :name, type: String
  field :address, type: String
  field :unit, type: String
  field :city, type: String
  field :state, type: String
  field :zip, type: Integer

  # add validations

  embeds_many :chores
  embeds_many :bills
  has_many :users
end
