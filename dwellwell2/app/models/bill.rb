class Bill
  include Mongoid::Document
  include Mongoid::Timestamps
  field :title, type: String
  field :amount, type: BigDecimal
  field :due_date, type: Date
  field :is_fixed?, type: Boolean

  embedded_in :house

end
