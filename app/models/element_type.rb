class ElementType < ApplicationRecord
    validates :typeName, presence: true, uniqueness: true
end
