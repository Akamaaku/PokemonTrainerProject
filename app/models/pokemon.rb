class Pokemon < ApplicationRecord
  belongs_to :generation
  belongs_to :element_type
end
