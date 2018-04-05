class MailingAddressesController < ApplicationController
  before_action :set_address, only: [:show, :edit, :destroy]
  before_action :check_cancel, only: [:create, :update]

  def index
    @addresses = MailingAddress.all
  end

  def show
  end

  def new
    @address = @addressable.build_mailing_address
  end

  def edit
  end

  def create
    @address = MailingAddress.new(address_params)
    @addressable = @address.mailing_address

    respond_to do |format|
      if @address.save
        format.html { redirect_to edit_polymorphic_path(@addressable), notice: 'MailingAddress was successfully created.' }
        format.json { render :show, status: :created, location: @address }
      else
        format.html { render :new }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @address.update(address_params)
        format.html { redirect_to edit_polymorphic_path(@address.mailing_addressable), notice: 'MailingAddress was successfully updated.' }
        format.json { render :show, status: :ok, location: @address }
      else
        format.html { render :edit }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @address.destroy
    respond_to do |format|
      format.html { redirect_to edit_polymorphic_path(@addressable), notice: 'MailingAddress was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_address
      @address = MailingAddress.find(params[:id])
      @addressable = @address.mailing_addressable
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def address_params
      params.require(:mailing_address).permit(:name, :addr1, :csz, :mailing_addressable_id, :mailing_addressable_type)
    end

    def check_cancel
      if params[:commit] == 'Cancel'
        @addressable = MailingAddress.new(address_params).mailing_addressable
        redirect_to edit_polymorphic_path(@addressable)
      end
    end

end
