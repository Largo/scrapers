require 'selenium-webdriver'

require 'webdrivers'

@driver = Selenium::WebDriver.for :firefox

options = Selenium::WebDriver::Firefox::Options.new
options.add_argument('-headless')
options.binary = "C:\\Program Files\\Mozilla Firefox\\firefox.exe"
driver = Selenium::WebDriver.for :firefox, options: options
driver.navigate.to 'https://suumo.jp/jj/chintai/ichiran/FR301FC001/?ar=090&bs=040&pc=30&smk=&po1=25&po2=99&shkr1=03&shkr2=03&shkr3=03&shkr4=03&sc=45201&ta=45&cb=0.0&ct=10.0&et=9999999&mb=0&mt=9999999&cn=9999999&fw2='
# Enter search criteria

5.times do 

  # Extract data from search results
  houses = driver.find_elements(:class, 'cassetteitem')
  houses.each do |house|
    name = house.find_element(:class, 'cassetteitem_content-title').text
    address = house.find_element(:class, 'cassetteitem_detail-col1').text
    rent = house.find_element(:class, 'cassetteitem_price--rent').text
    puts "Name: #{name}, Address: #{address}, Rent: #{rent}"
  end

  # find the button by its text
  next_button = driver.find_element(:link_text, '次へ')

  # click the button
  next_button.click
end

driver.quit
