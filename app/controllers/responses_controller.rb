class ResponsesController < ApplicationController
  before_filter :signed_in_user

  def new
    answered = Question.joins(responses: :user)
    unanswered = Question.where("id NOT IN (?)", answered.map(&:id))
    @question = unanswered.random
    @response = current_user.responses.build
    @nb_answers = 0
    if @question.choices.count > 1
      @question.choices.each do |choice|
        if choice.answer?
          @nb_answers += 1
        end
      end
    end
  end

  def create
    @response = Response.new(params[:response])
    if @response.save
      flash[:success] = "Good answer!"
      redirect_to 'new'
    else
      flash[:error] = "Wrong answer. The question will eventually come back..."
      redirect_to 'new'
    end
  end
end
