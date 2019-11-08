system("yarn install")
system("yarn run webpack --mode=development")
devtools::document()
devtools::install(quick = TRUE)
library(reacthexgrid)
withr::with_dir(new = "sandbox/", code = {
  htmlwidgets::saveWidget(
    widget = reacthexgrid(),
    file = "index.html",
    selfcontained = FALSE
  )
})