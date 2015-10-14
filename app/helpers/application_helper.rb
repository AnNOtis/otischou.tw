module ApplicationHelper
  def md(text)
    return '' if text.nil?
    raw Kramdown::Document.new(text, syntax_highlighter: 'rouge').to_html
  end
end
