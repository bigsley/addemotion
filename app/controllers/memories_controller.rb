class MemoriesController < ApplicationController
  before_action :set_memory, only: [:show, :edit, :update, :destroy]
  respond_to :json

  # GET /memories
  # GET /memories.json
  def index
    @memories = current_user.memories.all
    render json: {memories: @memories}
  end

  # GET /memories/1
  # GET /memories/1.json
  def show
    render json: {memory: @memory}
  end

  # GET /memories/new
  def new
    @memory = current_user.memories.new
  end

  # GET /memories/1/edit
  def edit
  end

  # POST /memories
  # POST /memories.json
  def create
    @memory = current_user.memories.new(memory_params)

    respond_to do |format|
      if @memory.save
        format.json { render json: {memory: @memory} }
      else
        format.json { render json: @memory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /memories/1
  # PATCH/PUT /memories/1.json
  def update
    respond_to do |format|
      if @memory.update(memory_params)
        format.html { redirect_to @memory, notice: 'Memory was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @memory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /memories/1
  # DELETE /memories/1.json
  def destroy
    @memory.destroy
    respond_to do |format|
      format.html { redirect_to memories_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_memory
      @memory = current_user.memories.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def memory_params
      params.require(:memory).permit(:mood, :stress, :explanation)
    end
end
