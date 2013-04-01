module TasksHelper
  def display_progress(progress, ends_at)
    if progress == 100
      content_tag :span, progress_span(progress), class: "task-green"
    elsif ends_at < Time.now && progress < 100
      content_tag :span, progress_span(progress), class: "task-red"
    else
      content_tag :span, progress_span(progress)
    end
  end
  
  def progress_span(progress)
    (progress/10).times.collect do
      content_tag :i, nil, class: "icon-stop"
    end.join.html_safe
  end
end
