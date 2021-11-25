# make a controller, then make view - folder has to be the same name 
class ArticlesController < ApplicationController
    before_action :set_article, only: [:edit, :update, :destroy, :show]

    def index
        #assign a value to the article
       @articles = Article.all

        #instance variable in a class "at"
    end

    def new
        @article = Article.new
    end

    def show
        @comments = @article.comments
        @comment = @article.comments.build
    end

    def create
        @article = Article.new(article_params)

        #if okay ang data, balik sa article index, else render the form again 
        if @article.save
            #redirect_to articles_ - papalitan ni REDIRECT YUNG URL
            flash[:notice] = "An article was successfully created"
            redirect_to articles_path
        else
            flash[:error] = "There are some errors encountered"
            render :new
        end
    end
    

    def edit
        
    end

    def update

        if @article.update(article_params)
            redirect_to articles_path, notice: "An article was successfully updated"
        else
            flash.error = "There are some errors encountered"
            render :edit
        end
    end

    def destroy
        @article.destroy
        redirect_to articles_path, notice: 'An article was successfully destoryed'
    end

    private

    def set_article
        @article = Article.find(params[:id])
    end
    
    def article_params
        params.require(:article).permit(:title, :author, :content)
    end
end