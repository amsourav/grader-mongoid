module QuestionsHelper
  def check_questions_count
    @exam.total_questions - @questions.count
  end

  def check_marks_count
    total = @exam.total_marks - @questions.pluck(:mark).map(&:to_i).sum.to_i
    if total < 0
      flash[:notice] = "Looks like you assigned more marks to questions"
      return total
    else
      return total
    end
  end

  def check_pages_count
    @questions.pluck(:pages).map(&:to_i).sum.to_i
  end

  def check_question_paper_complete
    if check_questions_count == 0 && check_marks_count == 0
      flash[:notice] = "Looks like you have completed making the question paper"
      return true
    end
  end
end
