module ApplicationHelper
  def title(page_title)
    content_for(:title) { page_title }
  end

  def days_of_week_options_for_select
      options_for_select([["monday" ,"1"],["tuesday", "2"],["wednesday" , "3"],["thursday", "4"],["friday", "5"]])
  end
end
