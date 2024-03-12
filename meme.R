library(magick)

# assign the cat images to two different variables
calm_cat <- image_read("https://pbs.twimg.com/profile_images/1162801143816364032/yQYjXuCp_400x400.jpg") %>%
  image_scale(500)

panic_cat <- image_read("https://i.pinimg.com/474x/2c/dc/6d/2cdc6d05a7e70bccaaa7b4bb48052720.jpg") %>%
  image_scale(500)

# assign the text portion of the meme to two different variables
first_text <- image_blank(width = 500, 
                          height = 500, 
                          color = "#FFFFFF") %>%
  image_annotate(text = "Me when the project is\ndue in two weeks.",
                 color = "#000000",
                 size = 50,
                 font = "Impact",
                 gravity = "center")

second_text <- image_blank(width = 500, 
                           height = 500, 
                           color = "#FFFFFF") %>%
  image_annotate(text = "Me when the project is\ndue in three days.",
                 color = "#000000",
                 size = 50,
                 font = "Impact",
                 gravity = "center")

# splice together the two text sections
text_row <- c(first_text, second_text) %>%
  image_append()

# splice together the two cat images
image_row <- c(calm_cat, panic_cat) %>%
  image_append()

# stack the two rows on top of one another
meme <- c(text_row, image_row) %>%
  image_append(stack = TRUE)

# run the variable of the stacked rows
# and write it to file under: "my_meme.png"
meme %>%
  image_write("my_meme.png")
