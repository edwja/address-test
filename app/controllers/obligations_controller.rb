class ObligationsController < ApplicationController
  before_action :set_obligation, only: [:show, :edit, :update, :destroy]

  # GET /obligations
  # GET /obligations.json
  def index
    @obligations = Obligation.all
  end

  # GET /obligations/1
  # GET /obligations/1.json
  def show
  end

  # GET /obligations/new
  def new
    @obligation = Obligation.new
  end

  # GET /obligations/1/edit
  def edit
  end

  # POST /obligations
  # POST /obligations.json
  def create
    @obligation = Obligation.new(obligation_params)

    respond_to do |format|
      if @obligation.save
        format.html { redirect_to @obligation, notice: 'Obligation was successfully created.' }
        format.json { render :show, status: :created, location: @obligation }
      else
        format.html { render :new }
        format.json { render json: @obligation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /obligations/1
  # PATCH/PUT /obligations/1.json
  def update
    respond_to do |format|
      if @obligation.update(obligation_params)
        format.html { redirect_to @obligation, notice: 'Obligation was successfully updated.' }
        format.json { render :show, status: :ok, location: @obligation }
      else
        format.html { render :edit }
        format.json { render json: @obligation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /obligations/1
  # DELETE /obligations/1.json
  def destroy
    @obligation.destroy
    respond_to do |format|
      format.html { redirect_to obligations_url, notice: 'Obligation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_obligation
      @obligation = Obligation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def obligation_params
      params.require(:obligation).permit(:state, :template_id)
    end
end
