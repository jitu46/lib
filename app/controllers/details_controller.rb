class DetailsController < ApplicationController
  before_action :find_detail, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  

  def index
  	@details = Detail.all
  end


  def show
  end
  

  def new
  	@detail = current_user.details.new
  end
  

  def edit
  end


  def create
  	@detail = current_user.details.new(detail_params)
  
  	if @detail.save
  		redirect_to @detail
  	else
  		render 'new'
  	end
  end


  def update
  
  	if @detail.update(detail_params)
  		redirect_to @detail
  	else
  		render 'edit'
  	end
  end


  def destroy
  	@detail.destroy
  	redirect_to root_path
  end


  private

  def find_detail
  	@detail = Detail.find(params[:id])
  end

  def detail_params
  	params.require(:detail).permit(:title, :body, :image)
  end



end
