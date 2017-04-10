![ketab](https://github.com/ghaseminya/ketabhome/raw/master/web/res/shop_assets/images/logo.png)

Table of Contents
=================
   * [Introduction](#introduction)
   * [Demo](#demo)
   * [Deploy War file in Tomcat](#deploy-war-file-in-tomcat)
   * [Your Compilation](#your-compilation)
      * [Netbeans idea](#netbeans-idea)
      * [Database Setting](#database-setting)
   * [Some Featurs](#some-featurs)
   * [More Information](#more-information)
   * [Some Screenshots](#some-screenshots)
   * [License](#license)




# Introduction
ketabhome is an simple online book store template

this shop has a simple admin panel too!

# Demo

shop index: http://ketabhome.ir

admin panel: http://ketabhome.ir/manage/index.jsp

username:admin

password:123

# Deploy War file in Tomcat
first star project and fork it
```shell
git clone https://github.com/ghaseminya/ketabhome
```
copy `final_dist/ketabhome.war` to [Apache Tomcat/webdir] and extract it then edit `WEB-INF/classes/c0p3-config.xml` with your database setting(such as username and passwor), then start tomcat and then go to this url:

http://localhost:8080/ketabhome/

http://localhost:8080/ketabhome/manage/index.jsp

username:admin

password:123

# Your Compilation
## Netbeans idea
add jar file in `./lib` folder to your project

## Database Setting
Just import ketabhome.sql in your database and config [c3p0-config.xml](https://github.com/ghaseminya/ketabhome/blob/master/src/java/c3p0-config.xml)

# Some Featurs
* [Bootstrap ACE admin dashboard](http://jason.insweet.family/ace/)
* Mysql
* [c3p0](https://github.com/ghaseminya/c3p0)
* JSP JSTL(core,fmt)
* [Simple Java Email](https://github.com/ghaseminya/simple-java-mail)
* I18N
* Error Handling page
* Admin Panel
* Netbeans needed file!

# More Information
* Website: http://ketabhome.ir/
* Roadmap(upcoming features and bug fixes): https://github.com/ghaseminya/ketabhome
* Hosting: [javahosting](http://www.javahosting.ir)
* Development: https://github.com/ghaseminya/ketabhome
* Copyright (C) 2017 javahosting.

# Some Screenshots
![index](https://github.com/ghaseminya/ketabhome/raw/master/screenshot/index.png)
![dashbaord](https://github.com/ghaseminya/ketabhome/raw/master/screenshot/dashbaord.png)
![login](https://github.com/ghaseminya/ketabhome/raw/master/screenshot/login.png)
![listbook](https://github.com/ghaseminya/ketabhome/raw/master/screenshot/listbook.png)
![listcateg](https://github.com/ghaseminya/ketabhome/raw/master/screenshot/listcateg.png)
![addbook](https://github.com/ghaseminya/ketabhome/raw/master/screenshot/addbook.png)
![addcateg](https://github.com/ghaseminya/ketabhome/raw/master/screenshot/addcateg.png)


# License

[GPL v3](./LICENSE).
