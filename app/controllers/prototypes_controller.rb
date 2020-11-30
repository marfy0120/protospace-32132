class PrototypesController < ApplicationController
  before_action :move_to_index, only: [:show]
  before_action :authenticate_user!
  def index
    @prototypes = Prototype.all
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.new(prototypes_params)
    if @prototype.save
      redirect_to root_path
      else
        render :new
  end
  end

  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = Comment.all
  end

  def edit
   if user_signed_in?
    @prototype = Prototype.find(params[:id])
   else
    redirect_to root_path
  end
  end

  def update
    @prototype = Prototype.find(params[:id])
    # prototype = Prototype.find(params[:id])
    @prototype.update(prototypes_params)
    if @prototype.save
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    # binding.pry
    prototype = Prototype.find(params[:id])
    prototype.destroy
    redirect_to root_path
  end
    


  private
  def prototypes_params
    params.require(:prototype).permit(:image, :title, :catch_copy, :concept).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end

  end

end
