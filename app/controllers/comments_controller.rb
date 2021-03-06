class CommentsController < ApplicationController
    before_action :set_article
    before_action :set_comment, only:[:edit, :update, :destroy, :set_comment]
     def index
        redirect_to article_path(@article)
     end



    def create
        @comment = @article.comments.build(comment_params)

        if @comment.save
            redirect_to article_path(@article)
        else
            @comments = @article.comments
            render 'articles/show'
        end
    end
    
    def edit

    end

    def update

        if @comment.update(comment_params)
            redirect_to article_comments_path, notice: "An article was successfully updated"
        else
            flash.error = "There are some errors encountered"
            render :edit
        end
    end

    def destroy
        @comment.destroy
        redirect_to article_path(@article)
 
      end

    private

    def comment_params
        params.require(:comment).permit(:content)
    end

    def set_article
        @article = Article.find(params[:article_id])
    end

    def set_comment
        @comment = @article.comments.find(params[:id])
    end
end
