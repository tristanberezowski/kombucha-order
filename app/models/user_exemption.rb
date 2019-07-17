class UserExemption < ApplicationRecord
    belongs_to :user
    belongs_to :exemptable, polymorphic: true
end
