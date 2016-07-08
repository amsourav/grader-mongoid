module ExamsHelper
  def total_pages
    @admitted_students.count * @exam.questions.pluck(:pages).map(&:to_i).sum.to_i
  end
end
