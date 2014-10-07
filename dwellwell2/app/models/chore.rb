class Chore
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title, type: String
  field :status, type: Boolean

  embedded_in :house

end
