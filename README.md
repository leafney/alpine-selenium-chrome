#### 说明

Alpine:v3.4 + Selenium + Chrome

#### 创建镜像

```
$ docker build -t="leafney/alpine-selenium-chrome" .
```

#### 创建一个容器进行测试

```
$ docker run -it --name alsech leafney/alpine-selenium-chrome /bin/sh
```

#### 拷贝py程序到容器中

```
$ docker cp chrome.py alsech:/root
```

#### Size

leafney/alpine-selenium-chrome    latest    272.8 MB

***

#### Selenium + Chrome Demo

`chrome.py`

```
# coding:utf-8
import time
from selenium import webdriver
from pyvirtualdisplay import Display

display = Display(visible=0, size=(800, 800))
display.start()

driver = webdriver.Chrome()

driver.get('http://www.cnblogs.com/')
time.sleep(5)

title = driver.title
print(title.encode('utf-8'))

# html=driver.page_source
# print(html)

# Release memory
driver.close()
driver.quit()
display.stop()
```

**Something Important**

If you run the  `chrome.py` file has error:

```
Message: unknown error: Chrome failed to start: crashed
```

And run `chromium-browser` has following error:

```
# chromium-browser
Failed to move to new namespace: PID namespaces supported, Network namespace supported, but failed: errno = Operation not permitted
```

Then to use the following method to solved it:

`chrome_fix.py`

```
# coding:utf-8
import time
from selenium import webdriver
from selenium.webdriver.chrome.options import Options
from pyvirtualdisplay import Display

display = Display(visible=0, size=(800, 800))
display.start()

chrome_options = Options()
chrome_options.add_argument("--no-sandbox")
driver = webdriver.Chrome(chrome_options=chrome_options)

driver.get('http://www.cnblogs.com/')
time.sleep(5)

title = driver.title
print(title.encode('utf-8'))

# html=driver.page_source
# print(html)

# Release memory
driver.close()
driver.quit()
display.stop()

```

Details view: [google-chrome fails to start in docker](https://github.com/wechaty/wechaty/issues/26)
