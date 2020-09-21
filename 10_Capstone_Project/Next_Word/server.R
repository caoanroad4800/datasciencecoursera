#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(stringr)
library(tm)
library(NLP)

#setwd("~/Soft/Rtest/datasciencecoursera/10_Capstone_Project/Next_Word/")

## load 2, 3, 4-gram word frequencies
bigram <- readRDS("./data/co_2gram_en.RDS")
trigram <- readRDS("./data/co_3gram_en.RDS")
quadgram <- readRDS("./data/co_4gram_en.RDS")


# seach in bigram frequency table
pred_bigram <- function(sentence_split){
    next_word <- as.character(
        head(
            bigram[bigram$word1 == sentence_split[1] ,]$word2, 1
        )
    )
    freq <- as.character(
        head(
            bigram[bigram$word1 == sentence_split[1] ,]$freq, 1
        )
    )
    if(identical(next_word, character(0))){
        next_word <- "it"
        freq <- 0
    }
    next_word_list <- list(next_word, freq)
    return(next_word_list)
}

# search in trigram frequency table
pred_trigram <- function(sentence_split){
    next_word <- as.character(
        head(
            trigram[(trigram$word1 == sentence_split[1] & trigram$word2 == sentence_split[2]) ,]$word3, 1
        )
    )
    freq <- as.character(
        head(
            trigram[(trigram$word1 == sentence_split[1] & trigram$word2 == sentence_split[2]) ,]$freq, 1
        )
    )
    next_word_list <- list(next_word, freq)
    if(identical(next_word, character(0))){
        next_word_list <- pred_func(sentence_split[2])
    }
    return(next_word_list)
}

# search in quadgram frequency table
pred_quadgram <- function(sentence_split){
    next_word <- as.character(
        head(
            quadgram[(quadgram$word1 == sentence_split[1] 
                      & quadgram$word2 == sentence_split[2]
                      & quadgram$word3 == sentence_split[3]) ,]$word4, 1
        )
    )
    freq <- as.character(
        head(
            quadgram[(quadgram$word1 == sentence_split[1] 
                     & quadgram$word2 == sentence_split[2]
                     & quadgram$word3 == sentence_split[3]) ,]$freq, 1
        )
    )
    next_word_list <- list(next_word, freq)
    if(identical(next_word, character(0))){
        next_word_list <- pred_func(paste(sentence_split[2], sentence_split[3], sep = " "))
    }
    return(next_word_list)
}


# prediction function, for searching the sentence by length
pred_func <- function(sentence, ngrams_words = 0){
    sentence_c <- stripWhitespace(
        removeNumbers(
            tolower(sentence)
            , preserve_intra_word_dashes = TRUE
        )
    )
    sentence_split <- strsplit(sentence_c, " ")[[1]]
    qwords <- length(sentence_split)
    if(qwords == 1 || ngrams_words == 2){
        next_word_list <- pred_bigram(tail(sentence_split, 1))
    }
    else if (qwords == 2 || ngrams_words == 3){
        next_word_list <- pred_trigram(tail(sentence_split, 2))
    }
    else if (qwords >2 || ngrams_words == 3){
        next_word_list <- pred_quadgram(tail(sentence_split, 3))
    }
    else{
        next_word_list <- list("it", 0)
    }
    return(next_word_list)
}




# calculate computing time required
test_time <- function(sentence, ngram_words = 0){
    ptm <- proc.time()
    pred_func(sentence, 0)
    elapsed <- proc.time() - ptm
    return(elapsed)
}

# histogram drawing
shinyServer(
    function(input, output){
        output$next_word <- renderPrint(
            {
                result <- pred_func(input$inputText, 0)
                result[[1]]
            }
        )
        output$bigram <- renderPrint(
            {
                result <- pred_func(input$inputText, 2)
                result[[1]]
            }
        )
        output$trigram <- renderPrint(
            {
                result <- pred_func(input$inputText, 3)
                result[[1]]
            }
        )
        output$quadgram <- renderPrint(
            {
                result <- pred_func(input$inputText, 4)
                result[[1]]
            }
        )
    }
)