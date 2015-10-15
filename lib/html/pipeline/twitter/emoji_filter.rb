module HTML
  class Pipeline
    module Twitter
      class EmojiFilter < HTML::Pipeline::Filter
        def call
          Twemoji.parse(doc)
        end
      end
    end
  end
end
