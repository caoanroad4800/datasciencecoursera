Introduction
------------

The project aims at building a NLP model to predict n-grams. The model
shall be embedded into a Shiny App.

This Milestone Report relates to exploratory data analysis regarding the
data of
<a href = "https://d396qusza40orc.cloudfront.net/dsscapstone/dataset/Coursera-SwiftKey.zip">
HC Corpora Dataset</a>.

File summary
------------

The data contains 4 languages (Deutsch, Finnish, Russian and English),
each language has 3 sources of input (blogs, news, and twitter), with a
tree-like structure as follows

    ##                                    levelName
    ## 1  ~                                        
    ## 2   °--Soft                                 
    ## 3       °--Rtest                            
    ## 4           °--JHU_capstone_project_data    
    ## 5               °--final                    
    ## 6                   ¦--de_DE                
    ## 7                   ¦   ¦--de_DE.blogs.txt  
    ## 8                   ¦   ¦--de_DE.news.txt   
    ## 9                   ¦   °--de_DE.twitter.txt
    ## 10                  ¦--fi_FI                
    ## 11                  ¦   ¦--fi_FI.blogs.txt  
    ## 12                  ¦   ¦--fi_FI.news.txt   
    ## 13                  ¦   °--fi_FI.twitter.txt
    ## 14                  ¦--ru_RU                
    ## 15                  ¦   ¦--ru_RU.blogs.txt  
    ## 16                  ¦   ¦--ru_RU.news.txt   
    ## 17                  ¦   °--ru_RU.twitter.txt
    ## 18                  °--en_US                
    ## 19                      ¦--en_US.blogs.txt  
    ## 20                      ¦--en_US.news.txt   
    ## 21                      °--en_US.twitter.txt

And each input has some lines of words. In sum, there are about 4.3
million line (sentences) of English data, which could be used.

    ##   country  blogs    news twitter
    ## 1      DE 371440  244743  947774
    ## 2      FI 439785  485758  285214
    ## 3      RU 337100  196360  881414
    ## 4      US 899288 1010242 2360148

And the total size, e.g. the english data, is about 550 Mb

    ##   country  blogs   news twitter
    ## 1      DE   81.5  91.16   72.08
    ## 2      FI 103.48  89.87   24.16
    ## 3      RU 111.44 113.48  100.31
    ## 4      US 200.42 196.28  159.36

We are dealing with \~102 Million word counts

    ##   country    blogs     news  twitter
    ## 1      DE 12653019 13219287 11803491
    ## 2      FI 12731005 10445964  3152758
    ## 3      RU  9405378  9115829  9223841
    ## 4      US 37334131 34372530 30373583

N-grams Frequency Analysis
--------------------------

A visualized, uni-gram word cloud is

<img src="data/word_cloud.png">

Accordingly, the uni-gram word frequency is

<img src = "data/uni-gram.png">

The uni-grams by source (blogs, news, and twitter) are as follows.

<img src = "data/uni-gram-source.png">

The tri-grams is

<img src = "data/tri-gram.png">

Prediction Model: Preliminary Thoughts
--------------------------------------

The plan is to use the N-grams as the basis for prediction. The use case
is: when the use input a word, the model finds the bi-gram/tri-gram even
4-grams with the greatest relative probability accordingly, and show the
words to user as candidate.
