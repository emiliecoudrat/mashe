module ParentHelper
  def status_label(status)
    icon = ''
    if status == 'mother'
      icon = 'fa-female'
    elsif status == 'father'
      icon = 'fa-male'
    end

    content_tag :span, class: 'label label-primary' do
      concat (content_tag :i, nil, class: "fa #{icon}")
      concat  " #{status}"
    end
  end
end