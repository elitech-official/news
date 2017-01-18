class VotesController < ApplicationController
  def create
    if current_user && params[:poll] && params[:poll][:id] && params[:vote_option] && params[:vote_option][:id]
      @poll = Poll.find_by_id(params[:poll][:id])
      @option = @poll.vote_options.find_by_id(params[:vote_option][:id])
      if @option && @poll && !current_user.voted_for?(@poll)
        @option.votes.create(user_id: current_user.id)
      else
        render js: 'alert(\'Вы уже отвечали на этот вопрос!\');'
      end
    else
      render js: 'alert(\'Ваш ответ не может быть сохранён!\');'
    end
  end
end
