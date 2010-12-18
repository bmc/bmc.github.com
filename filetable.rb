require 'yaml'

class HTMLFromYAML

    def initialize(input_yaml_file, output_html_file, options = {})
        @yaml = input_yaml_file
        @output_file = output_html_file
        @css_prefix = options.fetch('css_prefix', 'file_table')
        @table_css = "#{@css_prefix}_table"
        @subheading_css = "#{@css_prefix}_header"
        @entry_css = "#{@css_prefix}_entry"
        @blurb_css = "#{@css_prefix}_blurb"
        @desc_css = "#{@css_prefix}_desc"
    end

    def make
        puts("Making #{@output_file}")
        if not File.exists?(@yaml)
            error "Can't find file #{@yaml} in \\_includes directory."
        end

        begin
            make_output_html
        rescue
            if (File.exists? @output_file)
                File.delete @output_file
            end
        end
    end

    private

    def make_output_html
        File.open(@output_file, 'w') do |out |
            out << "<table markdown='1' class='#{@table_css}'>"

            data = YAML.load(File.open(@yaml, 'r'))
            if not data.is_a? Array
                error "#{@yaml}: Expected sequence of sections."
            end

            t = 0
            data.each do |section|
                t += 1
                topic = section['topic'] or
                    error "Missing 'topic' in section #{t}"

                out << sub_heading(topic)

                items = section['items'] or
                    error("Missing list items for topic '#{topic}'")
                if not items.is_a? Array
                    error("Items for topic '#{topic}' is not a list")
                end

                i = 0
                items.each do |item|
                    i += 1
                    error_prefix = "Topic '#{topic}', item #{i}"
                    url = item['url'] or error("#{error_prefix}: No URL")
                    blurb = item['blurb']
                    blurb_img = item['img']
                    if not blurb.nil?
                        # Use blurb
                    elsif not blurb_img.nil?
                        blurb = "![#{blurb_img}](#{blurb_img})"
                    else
                        error "#{error_prefix}: No 'blurb' or 'img'."
                    end
                    desc = item['description'] or
                        error"#{error_prefix}: No description"
                    out << entry(blurb, url, desc)
                end
            end
            out << '</table>'
        end
    end

    def sub_heading(text)
        %{
  <tr class="#{@subheading_css}">
    <td align="center" colspan="2">#{text}</td>
  </tr>
}
    end

    def entry(blurb, link, desc)
        %{
  <tr class="#{@entry_css}">
    <td class="#{@blurb_css}">
      <a href="#{link}">#{blurb}</a>
    </td>
    <td class="#{@desc_css}">#{desc}</td>
  </tr>
}
    end

    def error(msg)
        raise RuntimeException, msg
    end
end
