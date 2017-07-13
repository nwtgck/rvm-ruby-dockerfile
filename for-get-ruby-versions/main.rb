require 'nokogiri'
require 'open-uri'

# Release note page, which contains ruby versions
url = "https://www.ruby-lang.org/en/downloads/releases/"

# Get Document
# (from: http://morizyun.github.io/blog/ruby-nokogiri-scraping-tutorial/)
doc = open(url) do |f|
  Nokogiri::HTML.parse(f.read, nil, f.charset)
end

# : [Gem::Version]
ruby_verions = []

# Get release table trs
trs = doc.xpath(%q{//*[@id="content"]/table}).css('tr')
trs.each do |tr|
  tds = tr.css('td')
  # If non-<th> rows
  if tds.size != 0
    # Get first td, which should be written "Ruby x.y.z"
    td_content = tds.first.content # : String

    # If it has no "rc" "preview2" or some prefix
    if td_content.match(/^Ruby ([\d\.]+)$/)
      # Get ruby version
      version_str = $1
      version     = Gem::Version.new(version_str)
      ruby_verions << version
    end
  end
end


# Create versions str
versions_str = ruby_verions
  .sort
  .reverse
  .map{|v|
    v.to_s
  }
  .join(" ")
# Print for bash array
puts("vers=(#{versions_str})")
puts()

# This is for Docker hub description
ruby_verions.sort.reverse.each{|v|
  puts("docker pull nwtgck/rvm-ruby:#{v.to_s}")
}
