class ArticlesController < ApplicationController

	before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

	def index
		if params[:q]
		    @articles = Article.search(params[:q].to_s).order("created_at DESC").paginate(:page => params[:page], :per_page => 7)
		    @articles_archieve = Article.all.order("created_at DESC").limit(10)
		else
		    @articles = Article.all.order("created_at DESC").paginate(:page => params[:page], :per_page => 7)
		    @articles_archieve = Article.all.order("created_at DESC").limit(10)
		end
		@feeds = FeedEntry.all.order("published_at DESC").limit(10)
	end

	def new
		@article = Article.new
	end

	def create
		#render plain: params[:article].inspect
		@article = Article.new(article_params)

		if @article.save
			redirect_to @article
		else
			render 'new'
		end
	end

	def show
		@article = Article.find(params[:id].to_s)

		respond_to do |format|
    		format.html
	      	format.json { render json: @article }
	      	format.xml { render xml: @article }
	    end
	end

	def edit
		@article = Article.find(params[:id].to_s)
	end

	def update
		@article = Article.find(params[:id].to_s)

		if @article.update(article_params)
			redirect_to @article
		else
			render 'edit'
		end
	end

	def destroy
		@article = Article.find(params[:id].to_s)
		@article.destroy

		redirect_to articles_path
	end

	private
	def article_params
		params.require(:article).permit(:title, :text)
	end
end
