class House
  include Mongoid::Document
  field :name, type: String
  field :address, type: String
  field :unit, type: String
  field :city, type: String
  field :state, type: String
  field :zip, type: Integer

  # add validations
  validates_presence_of :name, :address, :city, :state, :zip
  validates_numericality_of :zip 
  # validates_length_of :zip, length: { minimum: 5, maximum: 5}

  embeds_many :chores
  # embeds_many :bills
  has_many :users

end
