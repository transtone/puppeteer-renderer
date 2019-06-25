FROM zenato/puppeteer

USER root

WORKDIR /usr/local/share/fonts 
RUN wget https://mirrors4.tuna.tsinghua.edu.cn/adobe-fonts/source-han-sans/OTF/SourceHanSansSC.zip &&  unzip SourceHanSansSC.zip
WORKDIR /usr/local/share/fonts/SourceHanSansSC
RUN fc-cache -f -v

# 添加 npm 设置
RUN npm set registry https://registry.npm.taobao.org/ && npm set puppeteer_download_host https://npm.taobao.org/mirrors

WORKDIR /app

COPY . /app
RUN cd /app && npm install --quiet

EXPOSE 3000

CMD npm run start
