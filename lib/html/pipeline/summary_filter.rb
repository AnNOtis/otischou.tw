module HTML
  class Pipeline
    class SummaryFilter < HTML::Pipeline::Filter
      def call
        @html = @html.split(/<!--more-->/).first
      end
    end
  end
end
