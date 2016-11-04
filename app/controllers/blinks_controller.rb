class BlinksController < ApplicationController
  before_action :set_blink, only: [:show, :edit, :update, :destroy]

  # GET /blinks
  # GET /blinks.json
  def index
    @blinks = Blink.all
  end

  # GET /blinks/1
  # GET /blinks/1.json
  def show
  end

  # GET /blinks/new
  def new
    @blink = Blink.new
  end

  # GET /blinks/1/edit
  def edit
  end

  # POST /blinks
  # POST /blinks.json
  def create
    @blink = Blink.new(blink_params)

    respond_to do |format|
      if @blink.save
        format.html { redirect_to @blink, notice: 'Blink was successfully created.' }
        format.json { render :show, status: :created, location: @blink }
      else
        format.html { render :new }
        format.json { render json: @blink.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /blinks/1
  # PATCH/PUT /blinks/1.json
  def update
    respond_to do |format|
      if @blink.update(blink_params)
        format.html { redirect_to @blink, notice: 'Blink was successfully updated.' }
        format.json { render :show, status: :ok, location: @blink }
      else
        format.html { render :edit }
        format.json { render json: @blink.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /blinks/1
  # DELETE /blinks/1.json
  def destroy
    @blink.destroy
    respond_to do |format|
      format.html { redirect_to blinks_url, notice: 'Blink was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blink
      @blink = Blink.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def blink_params
      params.require(:blink).permit(:status, :date)
    end
end
