require 'selenium-webdriver'
require 'webdrivers'

# Firefox の WebDriver インスタンスを作成する
@driver = Selenium::WebDriver.for :firefox

# Firefox のオプションを設定する
options = Selenium::WebDriver::Firefox::Options.new
options.add_argument('-headless')  # ヘッドレスモードで起動する
options.binary = "C:\\Program Files\\Mozilla Firefox\\firefox.exe"  # Firefox の実行ファイルのパスを指定する
driver = Selenium::WebDriver.for :firefox, options: options

# 検索ページに移動する
driver.navigate.to 'https://suumo.jp/jj/chintai/ichiran/FR301FC001/?ar=090&bs=040&pc=30&smk=&po1=25&po2=99&shkr1=03&shkr2=03&shkr3=03&shkr4=03&sc=45201&ta=45&cb=0.0&ct=10.0&et=9999999&mb=0&mt=9999999&cn=9999999&fw2='

# 検索条件を入力する

5.times do
  # 検索結果からデータを抽出する
  houses = driver.find_elements(:class, 'cassetteitem')
  houses.each do |house|
    name = house.find_element(:class, 'cassetteitem_content-title').text  # 物件名を取得する
    address = house.find_element(:class, 'cassetteitem_detail-col1').text  # 住所を取得する
    rent = house.find_element(:class, 'cassetteitem_price--rent').text  # 家賃を取得する
    puts "Name: #{name}, Address: #{address}, Rent: #{rent}"
  end

  # 「次へ」ボタンをクリックする
  next_button = driver.find_element(:link_text, '次へ')
  next_button.click
end

# WebDriver を終了する
driver.quit
