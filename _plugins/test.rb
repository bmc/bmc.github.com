module Jekyll
    class TestTag < Liquid::Tag

        def initialize(tag_name, text, tokens)
            super
        end

        def render(context)
            "Test tag. #{Time.now}"
        end
    end
end
