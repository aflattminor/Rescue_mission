class QuestionsController <ApplicationController

  def index
    @questions = Question.all
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers
    @answer = Answer.new
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.create(question_params)

    if @question.save
      flash[:notice] = "Question saved successfully"
      redirect_to question_path(@question)
    else
      flash[:errors] = @question.errors.full_messages.join(',')
      render :new
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    @question.update_attributes(question_params)
    if @question.save
      redirect_to @question, notice: "successfully updated"
    else
      render action: "edit"
      flash[:errors] = @question.errors.full_messages.join(',')
    end
  end

  def destroy
    @question = Question.find(params[:id])
    @question.delete
    redirect_to questions_path
  end

  def question_params
    params.require(:question).permit(:title, :question_text)
  end
end
