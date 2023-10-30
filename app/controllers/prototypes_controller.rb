class PrototypesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :new, :create]
  before_action :contributor_confirmation, only: [:edit, :update, :destroy]
  before_action :set_prototype, only: [:edit, :show]

  def index
    @prototypes = Prototype.all
  end
  
  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if
      @prototype.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    prototype= Prototype.find(params[:id])
    unless user_signed_in? && @prototype.user == current_user
      redirect_to root_path
    end
  end
  
  def show
    @prototype = Prototype.find(params[:id])
    @comments = @prototype.comments.includes(:user)
    @comment = Comment.new
  end

  def update 
    if @prototype.update(prototype_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if @prototype.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end
  private
  def  set_prototype
    @prototype = Prototype.find(params[:id])
  end

  def prototype_params
    params.require(:prototype).permit(:title, :concept, :image, :catch_copy).merge(user_id: current_user.id)
  end
  
  def contributor_confirmation
    set_prototype
    unless user_signed_in? && @prototype.user == current_user
      redirect_to root_path
    end
  end
end
