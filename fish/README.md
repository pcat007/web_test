### 简述
+ author: pcat@chamd5.org
+ 给HBCTF第8场出的简单web题。

### 出题目的
其中前端代码都是从以往钓鱼的页面上扒下来的，整个页面都是仿照真实的qq邮箱，在输入那里有js的控制，并且当符合规则的时候，不管你第1次如何输，都会要求你输入第2次，这就是钓鱼常用的招数，并且这2次都会存到文件里或者数据库里，之后登录会再跳转到真正的qq邮箱界面上。
这次把钓鱼界面弄成题目，也是为了提醒新手们小心这类的钓鱼骗局。至于题目考点，我也是思索了一番，但毕竟都是插入语句，暂时没想到怎么玩比较好，于是还是在查询上动手脚，也把所有权限、过滤都给弄掉，让新手多熟悉下sql注入语句和姿势。

### Change Log
^_^这个先占坑。

### 使用必知
+ 懂得docker以及Dockerfile
```
docker build -t "fish:v1" .
docker run -itd -p 666:80 fish:v1 /bin/bash
```
+ 看懂代码

### 文件介绍
* Dockerfile
> lamp:v1为一个安装了apache2、mysql、php的镜像

* start.sh
>+ 禁用apache2列目录
>+ 创建/var/www/html/uploads目录，并给予其他用户写入权限
>+ mysql新版本都是默认开启secure_file_priv，修改其值为/var/www/html/uploads
>+ 修改mysql密码，并导入fish.sql，然后删除fish.sql文件

* pcat_cat.tar.gz
> 源码的打包
