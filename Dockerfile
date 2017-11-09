# Selenium + Chrome

FROM alpine:3.4
MAINTAINER leafney "babycoolzx@126.com"

# 更新软件源
RUN echo "http://dl-4.alpinelinux.org/alpine/v3.4/main" >> /etc/apk/repositories && \
	echo "http://dl-4.alpinelinux.org/alpine/v3.4/community" >> /etc/apk/repositories


RUN apk update && \
	apk add python py-pip curl unzip libexif udev chromium chromium-chromedriver xvfb ttf-freefont && \
	pip install selenium && \
	pip install pyvirtualdisplay
