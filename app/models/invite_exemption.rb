class InviteExemption < ApplicationRecord
  belongs_to :invite
  belongs_to :exemptable, polymorphic: true
end
