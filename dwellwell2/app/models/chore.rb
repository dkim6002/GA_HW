class Chore
  include Mongoid::Document
  field :title, type: String
  field :is_done, type: Boolean
  field :assignment, type: String
  field :timestamps

  #add presence of assignments
  validates_presence_of :title

  embedded_in :house, :inverse_of => :chores

end