class Invite < ApplicationRecord
  include AASM

  belongs_to :admin
  belongs_to :user, optional: true

  has_many :invite_exemptions
  has_many :delivery_exemptions,
    through: :invite_exemptions,
    source: :exemptable,
    source_type: 'DeliveryExemption'

  validates_presence_of :email

  accepts_nested_attributes_for :delivery_exemptions

  before_create :generate_token

  aasm column: :status do
    state :undelivered, initial: true
    state :delivered
    state :accepted

    event :deliver do
      transitions from: :undelivered, to: :delivered
    end

    event :accept do
      transitions from: :delivered, to: :accepted
      after do
        create_user_exemptions
      end
    end
  end
  

  private

  def create_user_exemptions
    user.delivery_exemptions = delivery_exemptions
  end

  def generate_token
    self.token = Digest::SHA1.hexdigest([self.id, Time.now, rand].join)
  end
end
