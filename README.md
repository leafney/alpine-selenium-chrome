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

