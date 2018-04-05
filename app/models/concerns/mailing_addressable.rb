module MailingAddressable
  extend ActiveSupport::Concern

  included do
    has_one :mailing_address, as: :mailing_addressable
  end

  def mailing_address
    address = super
    if address.nil? && !self.class.fallback.nil?
      associate = self.send(self.class.fallback)
      address = associate&.mailing_address
    end
    address
  end

  def mailing_address_source
    self.mailing_address&.addressable
  end

  class_methods do
    def delegate_empty_mailing_address_to(associate)
      @fallback = associate
    end

    def fallback
      @fallback
    end
  end

end
