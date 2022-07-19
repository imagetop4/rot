
## 快速部署


[![](https://user-images.githubusercontent.com/30760636/96996783-0da82100-1563-11eb-9af1-3ecd0a83420b.png)](https://heroku.com/deploy?template=https://github.com/songsingss/ssmk/tree/main)


## 客户端配置文件 config.json

部署完毕，将以下文件中的 `${PASSWORD}` 和两个 `${APP_SITE}` 和 `${SECRET_PATH}` 替换成你的值就可以用于客户端了。

```json
{
    "password": "${PASSWORD}",
    "method": "aes-128-ctr",
    "protocol": "origin",
    "protocol_param": "",
    "obfs": "plain",
    "obfs_param": "",

    "udp": true,
    "idle_timeout": 300,
    "connect_timeout": 6,
    "udp_timeout": 6,

    "client_settings": {
        "server": "${APP_SITE}",
        "server_port": 443,
        "listen_address": "0.0.0.0",
        "listen_port": 1080
    },

    "over_tls_settings": {
        "enable": true,
        "server_domain": "${APP_SITE}",
        "path": "/${SECRET_PATH}/",
        "root_cert_file": ""
    }
}
```

另外，在具体应用页面，点击 `More` -> `Run console` 可以打开一个简易控制台窗口，通过该窗口输入命令
```bash
echo password=${PASSWORD}, path=${SECRET_PATH}, site=${APP_SITE}
```
找回关键参数时，会发现它們就是你的预设值。
