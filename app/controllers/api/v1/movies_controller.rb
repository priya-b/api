class Api::V1::MoviesController < ApplicationController

	
	def create
		@movie=Movie.new(movie_params)
		 if @movie.save
		render json:{message:'Successfully created',data:@movie,status_code:201}
	else
	render json:{message:'failure',data:@movie.errors,status_code:422}
	end
	end
	def index
    	@movies = Movie.all
    	render json:{message:'Successfully listed',data:@movies,status_code:200}
    end 
    def show
    	@movie = Movie.find_by_id(params[:id])
    	render json:{message:'Successfully displayed',data:@movie,status_code:200}
    end 

	
	def update
		@movie = Movie.find_by_id(params[:id])
        @movie.update_attributes(movie_params)
        render json:{message:'Successfully updated',data:@movie,status_code:200}
        
    end 
    def destroy
    	@movie = Movie.find_by_id(params[:id])
    	render json:{message:'Successfully deleted',data:@movie,status_code:200}
    	@movie.destroy

    
    end
    private
	def movie_params
		params.require(:movie).permit(:title,:year,:rating,:language,:actors,:director,:producer)
	end
	


end

    