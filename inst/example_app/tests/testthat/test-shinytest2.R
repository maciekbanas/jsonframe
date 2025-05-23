library(shinytest2)

test_that("{shinytest2} recording: jsonframe is registered", {
  app <- AppDriver$new(name = "Apply age filter")
  json_string <- app$get_value(output = "json_string")
  expect_equal(
    json_string,
    "[{\"name\":\"Alice\",\"age\":25,\"city\":\"New York\"},{\"name\":\"Bob\",\"age\":30,\"city\":\"San Francisco\"},{\"name\":\"Charlie\",\"age\":35,\"city\":\"Los Angeles\"},{\"name\":\"David\",\"age\":40,\"city\":\"Chicago\"},{\"name\":\"Eve\",\"age\":28,\"city\":\"New York\"},{\"name\":\"Frank\",\"age\":45,\"city\":\"Phoenix\"},{\"name\":\"Grace\",\"age\":32,\"city\":\"Philadelphia\"},{\"name\":\"Heidi\",\"age\":38,\"city\":\"Phoenix\"},{\"name\":\"Ivan\",\"age\":50,\"city\":\"New York\"},{\"name\":\"Judy\",\"age\":22,\"city\":\"Chicago\"},{\"name\":\"Karl\",\"age\":28,\"city\":\"San Jose\"},{\"name\":\"Laura\",\"age\":31,\"city\":\"Austin\"},{\"name\":\"Mallory\",\"age\":37,\"city\":\"Phoenix\"},{\"name\":\"Nathan\",\"age\":42,\"city\":\"Los Angeles\"}]"
  )
})

test_that("filtering by number (more than) works", {
  app <- AppDriver$new(name = "Apply age filter")
  app$set_inputs(filter_expression = "age >= 30")
  app$click("filter_btn")
  json_string_filtered <- app$get_value(output = "json_string")
  expect_equal(
    json_string_filtered,
    "[{\"name\":\"Bob\",\"age\":30,\"city\":\"San Francisco\"},{\"name\":\"Charlie\",\"age\":35,\"city\":\"Los Angeles\"},{\"name\":\"David\",\"age\":40,\"city\":\"Chicago\"},{\"name\":\"Frank\",\"age\":45,\"city\":\"Phoenix\"},{\"name\":\"Grace\",\"age\":32,\"city\":\"Philadelphia\"},{\"name\":\"Heidi\",\"age\":38,\"city\":\"Phoenix\"},{\"name\":\"Ivan\",\"age\":50,\"city\":\"New York\"},{\"name\":\"Laura\",\"age\":31,\"city\":\"Austin\"},{\"name\":\"Mallory\",\"age\":37,\"city\":\"Phoenix\"},{\"name\":\"Nathan\",\"age\":42,\"city\":\"Los Angeles\"}]"
  )
})

test_that("filtering by number (less then) works", {
  app <- AppDriver$new(name = "Apply age filter")
  app$set_inputs(filter_expression = "age < 35")
  app$click("filter_btn")
  json_string_filtered <- app$get_value(output = "json_string")
  expect_equal(
    json_string_filtered,
    "[{\"name\":\"Alice\",\"age\":25,\"city\":\"New York\"},{\"name\":\"Bob\",\"age\":30,\"city\":\"San Francisco\"},{\"name\":\"Eve\",\"age\":28,\"city\":\"New York\"},{\"name\":\"Grace\",\"age\":32,\"city\":\"Philadelphia\"},{\"name\":\"Judy\",\"age\":22,\"city\":\"Chicago\"},{\"name\":\"Karl\",\"age\":28,\"city\":\"San Jose\"},{\"name\":\"Laura\",\"age\":31,\"city\":\"Austin\"}]"
  )
})

test_that("filtering by number (equation) works", {
  app <- AppDriver$new(name = "Apply age filter")
  app$set_inputs(filter_expression = "age == 50")
  app$click("filter_btn")
  json_string_filtered <- app$get_value(output = "json_string")
  expect_equal(
    json_string_filtered,
    "[{\"name\":\"Ivan\",\"age\":50,\"city\":\"New York\"}]" 
  )
})

test_that("filtering by single character (double quotes) works", {
  app <- AppDriver$new(name = "Apply age filter")
  app$set_inputs(filter_expression = 'name == "David"')
  app$click("filter_btn")
  json_string_filtered <- app$get_value(output = "json_string")
  expect_equal(
    json_string_filtered,
    "[{\"name\":\"David\",\"age\":40,\"city\":\"Chicago\"}]"
  )
})

test_that("filtering by single character (single quotes) works", {
  app <- AppDriver$new(name = "Apply age filter")
  app$set_inputs(filter_expression = "name == 'David'")
  app$click("filter_btn")
  json_string_filtered <- app$get_value(output = "json_string")
  expect_equal(
    json_string_filtered,
    "[{\"name\":\"David\",\"age\":40,\"city\":\"Chicago\"}]"
  )
})

test_that("filtering by single character with spaces works", {
  app <- AppDriver$new(name = "Apply age filter")
  app$set_inputs(filter_expression = 'city == "New York"')
  app$click("filter_btn")
  json_string_filtered <- app$get_value(output = "json_string")
  expect_equal(
    json_string_filtered,
    "[{\"name\":\"Alice\",\"age\":25,\"city\":\"New York\"},{\"name\":\"Eve\",\"age\":28,\"city\":\"New York\"},{\"name\":\"Ivan\",\"age\":50,\"city\":\"New York\"}]"
  )
})

test_that("filtering by single character with spaces (single quotes) works", {
  app <- AppDriver$new(name = "Apply age filter")
  app$set_inputs(filter_expression = "city == 'Los Angeles'")
  app$click("filter_btn")
  json_string_filtered <- app$get_value(output = "json_string")
  expect_equal(
    json_string_filtered,
    "[{\"name\":\"Charlie\",\"age\":35,\"city\":\"Los Angeles\"},{\"name\":\"Nathan\",\"age\":42,\"city\":\"Los Angeles\"}]"
  )
})