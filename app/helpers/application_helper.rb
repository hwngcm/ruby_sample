module ApplicationHelper
  def full_title page_title = ""
    base_title = t("base")
    page_title.empty? ? base_title.to_s : page_title.to_s + " | " + base_title
  end
end
