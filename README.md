# 酒馆快速部署(使用1panel)

重启服务自动更新，配合1panel一键启停，只需要修改两个txt即可使用

使用方法
1. 将文件下载到本地
2. 修改Dockerfile中的`USER_NAME`和`USER_PASSWORD`
3. 上传到服务器中 (1panel 主机 -> 文件 选择一个找得到的位置上传即可)
4. 构建镜像并启动容器 (1panel 容器 -> 编排 -> 创建编排 -> 路径选择 
-> 选中docker-compose.yml文件 -> 确认，点击X退出不然会重复创建容器)
5. 部署上公网 (1panel 网站 -> 创建网站 -> 反向代理 -> 填写代理地址 127.0.0.1:8000 
附：貌似1panel不能使用ip做域名，自购一个域名配置dns解析到你服务器，然后填上吧)
6. 申请证书，注意没配置https就不要登陆酒馆，http是明文传输你的密码和用户名在公网上裸奔 
(1panel 网站 -> 证书 -> 使用自签证书/创建Acme账户、DNS账户在Let's Encrypt申请证书都可 后者齐全和自动续签证书)
7. 为网站添加证书开启https (1panel 网站 -> 配置 -> https -> 启动、选择证书、保存)
8. 进入你配置的网站 have fun heart

> 以上为服务器的，如果你是本地用户，只要你有docker [可以使用这个打包好的镜像](https://hub.docker.com/r/maifuwa/st)，但得自己更新`git pull --rebase --autostash`

> 有关配置网站、申请证书问题可看1panel的使用文档