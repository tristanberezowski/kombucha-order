class UserExemption < ApplicationRecord
    belongs_to :user
    belongs_to :exemptable, polymorphic: true

    def information
        if self.exemptable_type == 'DeliveryExemption'
            return "Delivery Fee: $#{self.exemptable.fee}"
        end
    end
end
