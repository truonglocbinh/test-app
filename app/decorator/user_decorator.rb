class UserDecorator < SimpleDelegator
  def display_name
    "decorator #{name}"
  end
end

# When comunicate with API use adapter pattern.
