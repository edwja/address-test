class Templates::MailingAddressesController < MailingAddressesController

  private
  def set_address
    @addressable = Template.find(params[:template_id])
    @address = @addressable.mailing_address
  end

end
