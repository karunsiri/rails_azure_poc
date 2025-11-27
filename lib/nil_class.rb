# frozen_string_literal: true

class NilClass
  def to_bool
    !nil?
  end
end
