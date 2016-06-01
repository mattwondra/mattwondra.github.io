class Jekyll::Converters::Markdown::MyCustomProcessor
  def initialize(config)
    require 'motion-markdown-it'
    @config = config
  rescue LoadError
    STDERR.puts 'You are missing a library required for Markdown. Please run:'
    STDERR.puts '  $ [sudo] gem install commonmarker'
    raise FatalException.new("Missing dependency: commonmarker")
  end

  def convert(content)
    # CommonMarker.render_html(content, :default)
    parser = MarkdownIt::Parser.new(:commonmark, { html: false })
    parser.render(content)
  end
end