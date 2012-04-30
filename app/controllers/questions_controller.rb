class QuestionsController < ApplicationController
  before_filter :admin_user, except: [:show]
  before_filter :signed_in_user

  def new
    @question = Question.new
    4.times { @question.choices.build }
  end

  def create
    @question = Question.new(params[:question])
    @question.nb_answers = count_answers(@question)
    if @question.save
      flash[:success] = "New question created."
      redirect_to questions_path
    else
      render 'new'
    end
  end

  def index
    @questions = Question.paginate(page: params[:page])
  end

  def show
    @question = Question.find(params[:id])
  end

  def destroy
    Question.find(params[:id]).destroy
    flash[:success] = "Question destroyed"
    redirect_to questions_path
  end

  def edit
      @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    @question.nb_answers = count_answers(params[:question])
    if @question.update_attributes(params[:question])
      flash[:success] = "Question updated"
      redirect_to questions_path
    else
      render 'edit'
    end
  end

  private

    def count_answers(question)
      if question.choices.count == 1
        nb_answers = 1
      else
        nb_answers = 0
        question.choices.each do |choice|
          if choice.answer?
            nb_answers += 1
          end
        end
        return nb_answers
      end
    end
end
