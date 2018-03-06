module ApplicationHelper
  def full_title(page_title = '')
    if page_title.empty?
      "jack - アプリ製作団体"
    else
      "#{page_title} | jack - アプリ製作団体"
    end
  end
  def distance_of_time_in_words(from_time, to_time)
    from_time = from_time.to_date if from_time.respond_to?(:to_date)
    to_time = to_time.to_date if to_time.respond_to?(:to_date)
    years = 0
    months = 0
    loop {
      from = from_time + years.year + months.month
      if    (to_time - (from + 1.year))  >= 0 then years  += 1
      elsif (to_time - (from + 1.month)) >= 0 then months += 1
      else break
      end
    }
    distance = ''
    distance += "#{years}年" if years != 0
    distance += "#{months}ヶ月"
    distance
  end
end
