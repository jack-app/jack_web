module ApplicationHelper
  def full_title(page_title = '')
    if page_title.empty?
      "jack - アプリ製作団体"
    else
      "#{page_title} | jack - アプリ製作団体"
    end
  end
end
