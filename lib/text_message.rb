class TextMessage
  attr_accessor :to, :from, :body

  def initialize(attributes = {})
    @to  = attributes[:to]
    @from = attributes[:from]
    @body = attributes[:body]
  end

end