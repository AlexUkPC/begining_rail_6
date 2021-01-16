class Car
  include ActiveModel::AttributeAssignment
  attr_accessor :make, :model, :year, :color

  def initialize(attributes = {})
    assign_attributes(attributes) if attributes

    super()
  end
  
  def paint
    self.color = new_color
  end
  
end