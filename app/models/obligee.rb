class Obligee < ApplicationRecord
  include MailingAddressable

  has_many :templates
end
