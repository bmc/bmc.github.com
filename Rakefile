                                                              # -*- ruby -*-

SOFTWARE_YAML = '_includes/software.yaml'
SOFTWARE_HTML = '_includes/software.html'

task :default => [SOFTWARE_HTML, :jekyll]

task :jekyll do |t|
    sh 'jekyll'
end

file SOFTWARE_HTML => [ SOFTWARE_YAML, 'index.md'] do |t|
    require_relative 'filetable'
    HTMLFromYAML.new(SOFTWARE_YAML, SOFTWARE_HTML,
                     {'css_prefix' => 'software'}).make
end
