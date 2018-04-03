class Template < ApplicationRecord
  include MailingAddressable

  belongs_to :obligee
  has_many :obligations

  delegate_empty_mailing_address_to :obligee

end
