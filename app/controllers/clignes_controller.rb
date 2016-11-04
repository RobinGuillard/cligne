class ClignesController < ApplicationController
  before_action :set_cligne, only: [:show, :edit, :update, :destroy, :who]

# On saute une etape de securite si on appel BOOK en JSON
  skip_before_action :verify_authenticity_token, only: [:who, :create]

  # GET /clignes
  # GET /clignes.json
  def index
    @clignes = Cligne.all
  end

  # GET /clignes/1
  # GET /clignes/1.json
  def show
  end

  # GET /clignes/new
  def new
    @cligne = Cligne.new
  end

  # GET /clignes/1/edit
  def edit
  end

  # POST /clignes
  # POST /clignes.json
  def create
    @cligne = Cligne.new(cligne_params)

    respond_to do |format|
      if @cligne.save
        format.html { redirect_to @cligne, notice: 'Cligne was successfully created.' }
        format.json { render :show, status: :created, location: @cligne }
      else
        format.html { render :new }
        format.json { render json: @cligne.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clignes/1
  # PATCH/PUT /clignes/1.json
  def update
    respond_to do |format|
      if @cligne.update(cligne_params)
        format.html { redirect_to @cligne, notice: 'Cligne was successfully updated.' }
        format.json { render :show, status: :ok, location: @cligne }
      else
        format.html { render :edit }
        format.json { render json: @cligne.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clignes/1
  # DELETE /clignes/1.json
  def destroy
    @cligne.destroy
    respond_to do |format|
      format.html { redirect_to clignes_url, notice: 'Cligne was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

# POST /shows/1/book.json
  def who
    # On crée un nouvel objet booking à partir des paramètres reçus
    @cligner = Cligneur.new(cligneur_params)
    # On précise que cet object Booking dépend du show concerné
    @cligner.cligne = @cligne

    respond_to do |format|
      if @cligner.save
        format.json
      else
        format.json { render json: @cligner.errors, status: :unprocessable_entity }
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cligne
      @cligne = Cligne.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cligne_params
      params.require(:cligne).permit(:status, :date)
    end

    # On ajoute les paramètres qu'on va envoyer avec le booking
    def cligneur_params
      params.require(:cligneur).permit(:user_name)
    end
end
