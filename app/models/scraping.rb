class Scraping
  def self.movie_urls
    links = []
    agent = Mechanize.new
    next_url = ""

    while true

    current_page = agent.get("http://www.muscle-elite.com/cat-001/index.html")
    elements = current_page.search('.category_item a')
    elements.each do |ele|
      links << ele.get_attribute('href')
    end

    next_link = current_page.at('.pagination .next a')
    break unless next_link
      next_url = next_link.get_attribute('href')
    end

    links.each do |link|
      get_product('http://www.muscle-elite.com' + link)
    end
  end

  def self.get_product(link)
    agent = Mechanize.new
    page = agent.get(link)
    name = page.at('#lower_headword h1').inner_text
    image_url = page.at('#item img')[:src] if page.at('#item img')

    product = Product.where(name: name, image_url: image_url).first_or_initialize
    product.save
  end
end