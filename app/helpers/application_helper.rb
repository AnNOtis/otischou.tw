module ApplicationHelper
  def md(text)
    context = {
      :asset_root => "http://your-domain.com/where/your/images/live/icons",
      :base_url   => "http://otischou.tw"
    }
    pipeline = HTML::Pipeline.new [
      HTML::Pipeline::MarkdownFilter,
      HTML::Pipeline::SanitizationFilter,
      HTML::Pipeline::ImageMaxWidthFilter,
      HTML::Pipeline::HttpsFilter,
      HTML::Pipeline::RougeFilter
    ], context.merge(:gfm => true) 
    pipeline.call(text)[:output].to_s.html_safe
  end
end
