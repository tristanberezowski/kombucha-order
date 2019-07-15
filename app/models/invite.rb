class Invite < ApplicationRecord
  belongs_to :admin

  validates_presence_of :email

  before_create :generate_token

  private

  def generate_token
    self.token = Digest::SHA1.hexdigest([self.id, Time.now, rand].join)
  end
end
