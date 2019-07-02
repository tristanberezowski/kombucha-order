class Container < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :volume
end
