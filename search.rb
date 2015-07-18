class LinkedIn
    require 'watir-webdriver'
    
  def initialize  
     @b = Watir::Browser.new
  end   
    
def start

  @profile_list = []

    #Login
    @b.goto 'https://www.linkedin.com/nhome'
    @b.text_field(:id => 'session_key-login').set 'jagannath_lenka@yahoo.com'
    @b.text_field(:id => 'session_password-login').set 'jlenka@123'
    @b.button(:id => 'signin').click
    
    #Search
    @b.text_field(:id => 'main-search-box').set 'Infosys AVP'
    @b.button(:name => 'search').click

    
    #paths = @b.ol(:id => 'results') 
    #get_profile_list(paths)

 
    20.times.each do |i|
      @b.li(:class => 'next').link.click    
      path =@b.ol(:id => 'results') 
      get_profile_list(path)
    end 
    
    p @profile_list.size
    
    @b.close

end

  
  def get_profile_list(paths) 
    sleep 10
    paths.links.each do |link|
       @profile_list << link.href if link.href.include? '/profile/view?'
    end
  end
  
  def get_profile_detail
    @profile_list.each do |profile|
     @b.goto(profile)
    end
  end
  
end  

LinkedIn.new.start