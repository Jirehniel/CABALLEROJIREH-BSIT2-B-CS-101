library(rvest)
library(httr)
library(polite)


# Set up polite scraper
polite::use_manners(save_as = 'polite_scrape.R')

# Define a list of IMDb movie URLs
movie_urls <- c("https://www.imdb.com/title/tt14230458/reviews/?ref_=tt_ov_rt" )

# Create empty vectors to store details
users <- c()
comments <- c()
ratings <- c()
dates <- c()

# Loop through each movie URL
for (movie_url in movie_urls) {
  # Loop until at least 300 reviews are scraped
  while(length(comments) < 300) {
    # Read the HTML content of the page
    page_content <- read_html(movie_url)
    
    # Scrape user, comments, ratings, and dates
    user_nodes <- page_content %>%
      html_nodes(".display-name-date span:nth-child(1)") %>%
      html_text()
    
    comment_nodes <- page_content %>%
      html_nodes(".text.show-more__control") %>%
      html_text()
    
    rating_nodes <- page_content %>%
      html_nodes(".review-container .ipl-ratings-bar span:nth-child(2)") %>%
      html_text()
    
    date_nodes <- page_content %>%
      html_nodes(".display-name-date span:nth-child(2)") %>%
      html_text()
    
    # Append scraped data to vectors
    users <- c(users, user_nodes)
    comments <- c(comments, comment_nodes)
    ratings <- c(ratings, rating_nodes)
    dates <- c(dates, date_nodes)
    
    # Check if there are more pages of reviews
    next_page_link <- page_content %>%
      html_nodes(".load-more-data") %>%
      html_attr("data-key")
    
    
  }
}

# Create a data frame with the scraped data
reviews_df <- data.frame(
  User = users[1:300],  # Limit to 3000 reviews (10 movies * 300 reviews)
  Comment = comments[1:300],
  Rating = ratings[1:300],
  Date = dates[1:300]
)

# Save as CSV
write.csv(reviews_df, file = "movie2.csv", row.names = FALSE)
# Print the scraped data frame
print(reviews_df)


