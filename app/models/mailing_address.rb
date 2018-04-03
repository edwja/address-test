class MailingAddress < ApplicationRecord
  belongs_to :mailing_addressable, polymorphic: true

  validates :mailing_addressable, presence: true
end
