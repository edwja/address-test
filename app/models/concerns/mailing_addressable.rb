module MailingAddressable
  extend ActiveSupport::Concern


  included do
    has_one :mailing_address, as: :mailing_addressable
  end

  def mailing_address
    address = super
    if address.nil? && !self.class.fallback.nil?
      parent = self.send(self.class.fallback)
      address = parent&.mailing_address
    end
    address
  end

  def mailing_address_source
    self.mailing_address&.mailing_addressable
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
