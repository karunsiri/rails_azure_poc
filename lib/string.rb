# frozen_string_literal: true

class String
  def to_bool
    # 'no' will cast to True
    return false if downcase == 'no'

    ActiveModel::Type::Boolean.new.cast(self)
  end
end
