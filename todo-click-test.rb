require 'rubygems'
require 'selenium-webdriver'

# Input capabilities

USERNAME = "shubhamr"
ACCESS_KEY = ENV["LT_ACCESS_KEY"]

options = Selenium::WebDriver::Options.chrome
options.browser_version = "107.0"
options.platform_name = "Windows 10"
lt_options = {};
lt_options[:username] = "#{USERNAME}";
lt_options[:accessKey] = "#{ACCESS_KEY}";
lt_options[:project] = "Untitled";
lt_options[:sessionName] = "Ruby Test";
lt_options[:build] = "Ruby Job";
lt_options[:seCdp]=true;
lt_options[:w3c] = true;
lt_options[:selenium_version]="4.0.0";
lt_options[:plugin] = "ruby-ruby";
options.add_option('LT:Options', lt_options);

driver = Selenium::WebDriver.for(:remote,
:url => "https://hub.lambdatest.com/wd/hub",
:capabilities => options)
begin


   



coordinates = {   
    "offline": true,
    "latency": 0,
    "download_throughput": 10,
    "upload_throughput": 10
                }

  devToolsSession = driver.devtools
  print(**coordinates)
  devToolsSession.send_cmd('Network.emulateNetworkConditions', coordinates)






#   coordinates = { latitude: 35.689487,
#                   longitude: 139.691706,
#                   accuracy: 100 }
#   devToolsSession = driver.devtools
#   print(**coordinates)
#   devToolsSession.send_cmd('Emulation.setGeolocationOverride', **coordinates)



  






driver.get('https://mylocation.org/')
driver.navigate.to "https://lambdatest.github.io/sample-todo-app/"
driver.find_element(:name, 'li1').click
driver.find_element(:name, 'li2').click
driver.find_element(:id, 'sampletodotext').send_keys("Yey, Let's add it to list")
driver.find_element(:id, 'addbutton').click
enteredText = driver.find_element(:xpath, '/html/body/div/div/div/ul/li[5]/span').text
enteredText == "Fifth Item" ? status = "passed" : status = "failed"
driver.execute_script('lambda-status='+ status)
end
print("Execution Successful\n")
driver.quit