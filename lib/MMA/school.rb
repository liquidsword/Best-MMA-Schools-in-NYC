class MMA::School

    attr_accessor :name, :location_info, :url
    
    def self.today
        self.schools

    end

    def self.schools
        @schools = []
        @schools << self.scrape_cbslocal
    end

    def self.scrape_cbslocal
        doc = Nokogiri::HTML(open("http://newyork.cbslocal.com/top-lists/5-best-mma-and-martial-arts-studios-in-new-york/"))
        

        schools = self.new
        schools.name = doc.search("//div/p/strong/span").text.strip
        schools.location_info = doc.search("//div/p")[4].text.strip
        schools.url = doc.search("//div/p/a")[0].text.strip

        #school = self.new
        #school.name = doc.search("//div/p/span")[0].text.strip
        #school.location_info = doc.search("//div/p")[7].text.strip
        #school.url = doc.search("//div/p/a")[2].text.strip

        #school = self.new
        #school.name = doc.search("//div/p/span")[1].text.strip
        #school.location_info = doc.search("//div/p")[9].text.strip
        #school.url = doc.search("//div/p/a")[3].text.strip

        #school = self.new
        #school.name = doc.search("//div/p/span")[2].text.strip
        #school.location_info = doc.search("//div/p")[12].text.strip
        #school.url = doc.search("//div/p/a")[5].text.strip

        #school = self.new
        #school.name = doc.search("//div/p/span")[3].text.strip
        #school.location_info = doc.search("//div/p")[14].text.strip
        #school.url = doc.search("//div/p/a")[6].text.strip

        @schools
    end

end