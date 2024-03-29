FROM heroku/heroku:18
LABEL maintainer="https://github.com/ShadowsocksR-Live/"

RUN apt install curl unzip -y \
 && mkdir -m 777 /ssrbin \
 && chgrp -R 0 /ssrbin \
 && chmod -R g+rwX /ssrbin \
 && curl -L -H "Cache-Control: no-cache" -o ssr.zip https://github.com/ShadowsocksR-Live/shadowsocksr-native/releases/download/0.9.0/ssr-native-linux-x64.zip \
 && unzip ssr.zip -d /ssrbin ssr-server config.json \
 && chmod +x /ssrbin/ssr-server \
 && chmod -x+rw /ssrbin/config.json \
 && rm -rf ssr.zip

ADD entrypoint.sh /ssrbin/entrypoint.sh
RUN chmod +x /ssrbin/entrypoint.sh 

CMD /ssrbin/entrypoint.sh
