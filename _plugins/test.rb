module Jekyll
    class TestTag < Liquid::Tag

        safe true

        def initialize(tag_name, text, tokens)
            super
        end

        def render(context)
            "Test tag. #{Time.now}"
        end
    end
end
