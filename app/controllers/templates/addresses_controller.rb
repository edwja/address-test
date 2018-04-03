class Templates::AddressesController < AddressesController

  private
  def set_address
    @addressable = Template.find(params[:template_id])
    @address = @addressable.address
  end

end
