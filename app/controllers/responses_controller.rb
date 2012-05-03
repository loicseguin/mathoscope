class ResponsesController < ApplicationController
  before_filter :signed_in_user

  def new
    answered = Question.joins(responses: :user).where(
      'user_id = ? AND good_answer = ?', current_user.id, true)
    if answered.count == 0
      unanswered = Question.where('')
    else
      unanswered = Question.where("id NOT IN (?)", answered.map(&:id))
    end
    if unanswered.count == 0
      @done = true
    end
    @question = unanswered.random
  end

  def create
    @question = Question.find(params[:question_id])
    @response = current_user.responses.build(question_id: @question.id)
    
    if params[:commit] == 'Submit' && params[:response] && params[:response][:content] != ""
      if @question.nb_answers == 1
        answer = nil

        @question.choices.each do |choice|
          if choice.answer?
            answer = choice.content
            break
          end
        end

        if answer == params[:response][:content]
          @response.good_answer = true
          flash[:success] = "Good answer!"
        else
          @response.good_answer = false
          flash[:error] = "Wrong answer!"
        end

        @response.content = params[:response][:content]
        save_response(@response)

      else
        # many answers
        error = false
        @question.choices.each do |choice|
          if choice.answer?
            if params[:response][choice.content] == nil
              error = true
              break
            end
          end
        end
        if error
          @response.good_answer = false
          flash[:error] = 'Wrong answer!'
        else
          @response.good_answer = true
          flash[:success] = "Good answer!"
        end
        @response.content = params[:response].keys.to_s
        save_response(@response)
      end
    end
    redirect_to '/testme'
  end


  private

    def save_response(response)
      if response.good_answer
        update_score(current_user, current_user.score + 10)
      end
      if !response.save
        flash[:notice] = "There was a problem saving your response."
      end
    end

    def update_score(user, score)
      if user.update_attribute(:score, score)
        sign_in user
      else
        flash[:notice] = "There was a problem updating your score."
      end
    end

end
