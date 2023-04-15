class Acceptance
  include ActiveModel::Model
  attr_accessor :accepting

  validates :accepting, acceptance: {accept: 'yes'}
end
