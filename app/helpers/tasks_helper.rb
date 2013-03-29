module TasksHelper
  def display_progress(task)
    if task.progress == 100
      content_tag :span, progress_span(task.progress), class: "task-green"
    elsif task.ends_at < Time.now && task.progress < 100
      content_tag :span, progress_span(task.progress), class: "task-red"
    else
      content_tag :span, progress_span(task.progress)
    end
  end
  
  def progress_span(progress)
    (progress/10).times.collect do
      content_tag :i, nil, class: "icon-stop"
    end.join.html_safe
  end
end
