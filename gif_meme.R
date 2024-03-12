library(magick)

# assign the static cat image to a variable "calm_cat"
calm_cat <- image_read("https://pbs.twimg.com/profile_images/1162801143816364032/yQYjXuCp_400x400.jpg") %>%
  image_scale(500)

# assign each frame of the animated gif portion to different variables
panic_one <- image_read("https://i.pinimg.com/474x/2c/dc/6d/2cdc6d05a7e70bccaaa7b4bb48052720.jpg") %>%
  image_scale(500)
panic_two <- image_read("https://i.redd.it/s54csfdptna71.jpg") %>%
  image_scale(500)
panic_three <- image_read("https://i.pinimg.com/236x/a2/fb/8f/a2fb8f19ea6c565a496604b97f23bfe2.jpg") %>%
  image_scale(500)
panic_four <- image_read("https://www.meme-arsenal.com/memes/f144d39eb016768e8e4957fe55431f5c.jpg") %>%
  image_scale(500)
panic_five <- image_read("https://preview.redd.it/5ikb46t3poo41.jpg?auto=webp&s=da8e49f2f5077cab0ddafd8c8b8228e0cddb744d") %>%
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

# splice together each frame of the two cat images
image_row_one <- c(calm_cat, panic_one) %>%
  image_append()
image_row_two <- c(calm_cat, panic_two) %>%
  image_append()
image_row_three <- c(calm_cat, panic_three) %>%
  image_append()
image_row_four <- c(calm_cat, panic_four) %>%
  image_append()
image_row_five <- c(calm_cat, panic_five) %>%
  image_append()

# stack the two rows on top of one another for each frame
meme_one <- c(text_row, image_row_one) %>%
  image_append(stack = TRUE)
meme_two <- c(text_row, image_row_two) %>%
  image_append(stack = TRUE)
meme_three <- c(text_row, image_row_three) %>%
  image_append(stack = TRUE)
meme_four <- c(text_row, image_row_four) %>%
  image_append(stack = TRUE)
meme_five <- c(text_row, image_row_five) %>%
  image_append(stack = TRUE)

# assign each full frame to an array and animate it
frames <- c(meme_one, meme_two, meme_three, meme_four, meme_five)
animated_meme <- image_animate(frames, fps = 1)

# run the variable of the stacked frames
# and write it to file under: "my_animation.gif"
animated_meme %>%
  image_write("my_animation.gif")

