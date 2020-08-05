#安装必要的依赖包

install.packages(c('repr', 'IRdisplay', 
                   'evaluate', 'crayon', 
                   'pbdZMQ', 'devtools', 
                   'uuid', 'digest')) 

#IRkernel包没有放在CRAN上，需要通过GitHub安装
devtools::install_github('IRkernel/IRkernel') 
IRkernel::installspec() #确保jupyterLab能找到R解释器安装位置