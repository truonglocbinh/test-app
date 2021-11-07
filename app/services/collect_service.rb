class CollectService
  def initialize(data)
    @name = data
  end

  def convert
    "this is #{@name}"
  end
end
