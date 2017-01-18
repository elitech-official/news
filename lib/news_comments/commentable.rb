require 'active_support/concern'

module NewsComments::Commentable
  extend ActiveSupport::Concern

  included do
    before_filter :comments, only: [:show]
  end

  def comments
    @commentable = find_commentable
    @comments = @commentable.comments.arrange(order: 'created_at DESC')
    @comment = Comment.new
  end

  private

  def find_commentable
    params[:controller].singularize.classify.constantize.friendly.find(params[:id])
  end
end
