class Url < ApplicationRecord
  validates :generated_token, uniqueness: true
  validates :base_url, format: { with: /\w+-*\w+(\.{1}\w+-*\w+)+(\/\w+-*\w+(\?{1}(\w+={1}.*)(&\w+={1}.*)*))*/ }
end
