from selenium import webdriver
 
#https://torina.top/detail/264/

driver = webdriver.PhantomJS()  # ここがかわった
driver.get("https://torina.top/")
for h2 in driver.find_elements_by_tag_name("h2"):
    print(h2.text)
driver.quit()