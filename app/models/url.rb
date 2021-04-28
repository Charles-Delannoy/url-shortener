class Url < ApplicationRecord
  validates :generated_token, uniqueness: true
  validates :base_url, format: { with: /\w+-*\w+(\.{1}\w+-*\w+)+(\/\w+-*\w+(\?{1}(\w+={1}.*)(&\w+={1}.*)*))*/ }

  belongs_to :user, optional: true

  class << self
    CHARACTERS = [*'a'..'z', *'A'..'Z', *'0'..'9'].freeze

    def generate_token
      token = ''
      6.times { token += CHARACTERS.sample }
      token
    end
  end
end
