class Invite < ApplicationRecord
  belongs_to :admin

  has_many :invite_exemptions
  has_many :delivery_exemptions,
    through: :invite_exemptions,
    source: :exemptable,
    source_type: 'DeliveryExemption'

  validates_presence_of :email

  accepts_nested_attributes_for :delivery_exemptions

  before_create :generate_token

  private

  def generate_token
    self.token = Digest::SHA1.hexdigest([self.id, Time.now, rand].join)
  end
end
