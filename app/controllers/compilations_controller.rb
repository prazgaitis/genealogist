class CompilationsController < ApplicationController
  before_action :set_compilation, only: [:show, :edit, :update, :destroy]

  # GET /compilations
  # GET /compilations.json
  def index
    @compilations = Compilation.all
  end

  # GET /compilations/1
  # GET /compilations/1.json
  def show
  end

  # GET /compilations/new
  def new
    @compilation = Compilation.new
  end

  # GET /compilations/1/edit
  def edit
  end

  # POST /compilations
  # POST /compilations.json
  def create
    compilation_params = compilation_params.merge({
      uuid: SecureRandom.uuid.first(8),
      status: "pending"
    })

    @compilation = Compilation.new(compilation_params)

    respond_to do |format|
      if @compilation.save

        format.html { redirect_to @compilation, notice: 'Compilation was successfully created.' }
        format.json { render :show, status: :created, location: @compilation }
      else
        format.html { render :new }
        format.json { render json: @compilation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /compilations/1
  # PATCH/PUT /compilations/1.json
  def update
    respond_to do |format|
      if @compilation.update(compilation_params)
        format.html { redirect_to @compilation, notice: 'Compilation was successfully updated.' }
        format.json { render :show, status: :ok, location: @compilation }
      else
        format.html { render :edit }
        format.json { render json: @compilation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /compilations/1
  # DELETE /compilations/1.json
  def destroy
    @compilation.destroy
    respond_to do |format|
      format.html { redirect_to compilations_url, notice: 'Compilation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_compilation
      @compilation = Compilation.find_by(uuid: params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def compilation_params
      params#.require(:compilation).permit(:page_count, :url_identifier, :status, :uuid)
    end
end
