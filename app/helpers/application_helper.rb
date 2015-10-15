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
      HTML::Pipeline::RougeFilter,
      HTML::Pipeline::Twitter::EmojiFilter,
    ], context.merge(:gfm => true)
    pipeline.call(text)[:output].to_s.html_safe
  end

  def md_with_summary(text)
    context = {
      :asset_root => "http://your-domain.com/where/your/images/live/icons",
      :base_url   => "http://otischou.tw"
    }
    pipeline = HTML::Pipeline.new [
      HTML::Pipeline::SummaryFilter,
      HTML::Pipeline::MarkdownFilter,
      HTML::Pipeline::SanitizationFilter,
      HTML::Pipeline::ImageMaxWidthFilter,
      HTML::Pipeline::HttpsFilter,
      HTML::Pipeline::RougeFilter,
      HTML::Pipeline::Twitter::EmojiFilter,
    ], context.merge(:gfm => true)
    pipeline.call(text)[:output].to_s.html_safe
  end
end
