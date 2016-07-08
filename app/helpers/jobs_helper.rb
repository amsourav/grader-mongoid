module JobsHelper
  def teachers_assigned_to_this_job
    teachers_id = @jobs.pluck(:teacher).uniq
    teacher = Teacher.find(teachers_id).map(&:email)

    content_tag(:ul, :class => 'list') do
      teacher.collect do |t|
        concat(
          content_tag(:li, class: 'item') do
            t
          end
          )
      end
    end
  end

  def total_jobs_count
    @jobs.length
  end

  def total_jobs_completed_count
    a = @jobs.includes(:grade).map(&:grade)
    a.delete(nil)
    return a.length
  end

  def question_chart_json(question)
    marks = question.jobs.includes(:grade).map(&:grade).map(&:assigned_marks).map(&:sum)
    rolls = question.jobs.includes(:grade).map(&:grade).map(&:student).map(&:roll)
    return Hash[rolls.zip marks]
  end

  def total_marks_statitics(questions)
    vari = Hash.new
    questions.each do |question|
       vari = vari.update(question_chart_json(question)) { |k,v1,v2| v1+v2 }
    end
    return vari
  end
end
