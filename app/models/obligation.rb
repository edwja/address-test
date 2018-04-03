class Obligation < ApplicationRecord
  include MailingAddressable

  belongs_to :template

  delegate_empty_mailing_address_to :template

end
