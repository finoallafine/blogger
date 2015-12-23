class ArticlesController < ApplicationController

	before_filter :require_login, except: [:index, :show]
	
	include ArticlesHelper

	def index
		@articles = Article.all
	end

	def show
		@article = Article.find(params[:id])
		@comment = Comment.new
		# @comment = @article.comments.new
		@comment.article_id = @article.id
	end

	def new
		@article = Article.new
	end

	def create
		# @article = Article.new(params[:article])
			# title: params[:article][:title],
			# body: params[:article][:body])
		# @article.title = params[:article][:title]
		# @article.body = params[:article][:body]
		@article = Article.new(article_params)
		@article.save

		flash.notice = "Atricle '#{@article.title}' created!"

		redirect_to article_path(@article)
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy

		flash.notice = "Atricle '#{@article.title}' deleted!"

		redirect_to articles_path
	end

	def edit
		@article = Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])
		@article.update(article_params)

		flash.notice = "Article '#{@article.title}' updated!"

		redirect_to articles_path(@article)
	end
end
