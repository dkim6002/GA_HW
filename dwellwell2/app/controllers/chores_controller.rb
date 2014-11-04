class ChoresController < ApplicationController

  # GET /chores
  # GET /chores.json
def index
	@chores = Chore.all
end

  # GET /chores/1
  # GET /chores/1.json
def show
	@chore = Chore.find(params[:id])
	@user = User.find(current_user)
	@user.set(chore_key: @chore.id).find(['email'])
end

  # GET /houses/new
def new
	@chore = Chore.new
end

  # GET /houses/1/edit
def edit
end


  # POST /houses
  # POST /houses.json
#   def create
#   @house = House.find(params[:house_id])
#   @chore = @house.chores.create!(params[:house])
#   redirect_to @house, :notice => "Chore created!"
# end
  def create
    @house = House.where('chores_id' => @chore_id).first
    title = chore_params[:title]
    assignment = chore_params[:assignment]
    @chore = @house.chores.create!(title: title, assignment: assignment)
  
    respond_to do |format|
      if @house.save
        format.html { redirect_to @house, notice: 'chore was successfully created.' }
        format.json { render :show, status: :created, location: @house }
      else
        format.html { render :new }
        format.json { render json: @chore.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chores/1
  # PATCH/PUT /chores/1.json
  def update
    respond_to do |format|
      if @chore.update(chore_params)
        format.html { redirect_to @chore, notice: 'Chore was successfully updated.' }
        format.json { render :show, status: :ok, location: @chore }
      else
        format.html { render :edit }
        format.json { render json: @chore.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chores/1
  # DELETE /chores/1.json
  def destroy
    @house = House.where('chore_id' => @chore_id).first
    @chore = @house.chores.where(id: params[:id]).first
    respond_to do |format|
      if @chore.delete
        redirect_to root_path, notice: 'Chore was successfully destroyed.'
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chore
      @chore = Chore.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chore_params
      params.require(:chore).permit(:title, :assignment)
    end
end

