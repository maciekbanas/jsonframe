library(shinytest2)

test_that("example_app works", {
  skip_on_cran()
  appdir <- system.file(package = "jsonframe", "example_app")
  test_app(appdir)
})