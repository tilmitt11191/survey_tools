
#pip install requests
#pip install lxml
#pip3 install cssselect
#pip3  install selenium
#sudo apt-get install -y phantomjs

import lxml.html
from selenium import webdriver

#http://ieeexplore.ieee.org/Xplore/dynhome.jsp?tag=1&tag=1
#http://ieeexplore.ieee.org/search/searchresult.jsp?queryText=deep%20learning%20traffic&sortType=desc_p_Citation_Count

#target_url = 'http://ieeexplore.ieee.org/Xplore/dynhome.jsp?tag=1&tag=1'
target_url = "http://ieeexplore.ieee.org/search/searchresult.jsp?queryText=deep%20learning%20traffic&sortType=desc_p_Citation_Count"
print("target_url["+target_url+"]")
driver = webdriver.PhantomJS()
print("driver created")
driver.get(target_url)
print("driver.get(target_url) finished.")
links = driver.find_elements_by_tag_name("h2")
print(len(links))
root = lxml.html.fromstring(driver.page_source)
#links = root.cssselect("a") #229
#links = root.xpath("a") #229
#links = root.xpath("h2")#0
#links = root.cssselect("h2 > a")#10
#links = root.cssselect("h2 > a")
print(len(links))
for link in links:
	print("link")
	#print(link.text)
	#print(link.text_content())
	print(link)
driver.quit()

"""
import lxml.html
import requests

target_url = 'http://news.tv-asahi.co.jp/news_politics/articles/000041338.html'
target_html = requests.get(target_url).text
root = lxml.html.fromstring(target_html)
#text_content()メソッドはそのタグ以下にあるすべてのテキストを取得する
root.cssselect('#news_body > p').text_content()
"""

"""
import lxml.html
from selenium import webdriver

target_url = 'http://news.tv-asahi.co.jp/news_politics/articles/000041338.html'
driver = webdriver.PhantomJS()
driver.get(target_url)
root = lxml.html.fromstring(driver.page_source)
links = root.cssselect('#relatedNews a')
for link in links:
    print(link.text)
"""










