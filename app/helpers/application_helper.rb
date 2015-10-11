module ApplicationHelper
  def md(text)
    raw Kramdown::Document.new(text, syntax_highlighter: 'rouge').to_html
  end
end
