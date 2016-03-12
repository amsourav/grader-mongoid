class HandleFileConversionJob < ActiveJob::Base
  
  def self.queue
  	:urgent
  end

  def self.perform(doc, no_of_ques, no_of_students)
  	document = PDFShaver::Document.new(doc)
  	dir = File.dirname(doc)
  	portrait_pages = document.pages.select{ |page| page.aspect < 1 }
    for i in 1..no_of_students
      var = no_of_ques*(i-1)
      for j in 1..no_of_ques
        page = portrait_pages[var]
        dimensions = page.extract_dimensions_from_gm_geometry_string('800x')
        out_path = File.join(dir,"#{i}_#{j}.jpg")
        page.render(out_path, dimensions)
        var = var + 1
      end
    end  
  end
end
