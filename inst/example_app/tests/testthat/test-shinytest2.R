library(shinytest2)

test_that("{shinytest2} recording: jsonframe is registered", {
  app <- AppDriver$new(name = "Apply age filter")
  json_string <- app$get_value(output = "json_string")
  expect_equal(
    json_string,
    "[{\"name\":\"Alice\",\"age\":25,\"city\":\"New York\"},{\"name\":\"Bob\",\"age\":30,\"city\":\"San Francisco\"},{\"name\":\"Charlie\",\"age\":35,\"city\":\"Los Angeles\"},{\"name\":\"David\",\"age\":40,\"city\":\"Chicago\"},{\"name\":\"Eve\",\"age\":28,\"city\":\"Houston\"},{\"name\":\"Frank\",\"age\":45,\"city\":\"Phoenix\"},{\"name\":\"Grace\",\"age\":32,\"city\":\"Philadelphia\"},{\"name\":\"Heidi\",\"age\":38,\"city\":\"San Antonio\"},{\"name\":\"Ivan\",\"age\":50,\"city\":\"San Diego\"},{\"name\":\"Judy\",\"age\":22,\"city\":\"Dallas\"},{\"name\":\"Karl\",\"age\":28,\"city\":\"San Jose\"},{\"name\":\"Laura\",\"age\":31,\"city\":\"Austin\"},{\"name\":\"Mallory\",\"age\":37,\"city\":\"Jacksonville\"},{\"name\":\"Nathan\",\"age\":42,\"city\":\"Fort Worth\"}]"
  )
})

test_that("{shinytest2} recording: Apply age >= 30 filter", {
  app <- AppDriver$new(name = "Apply age filter")
  app$set_inputs(filter_expression = "age >= 30")
  app$click("filter_btn")
  json_string_filtered <- app$get_value(output = "json_string")
  expect_equal(
    json_string_filtered,
    "[{\"name\":\"Bob\",\"age\":30,\"city\":\"San Francisco\"},{\"name\":\"Charlie\",\"age\":35,\"city\":\"Los Angeles\"},{\"name\":\"David\",\"age\":40,\"city\":\"Chicago\"},{\"name\":\"Frank\",\"age\":45,\"city\":\"Phoenix\"},{\"name\":\"Grace\",\"age\":32,\"city\":\"Philadelphia\"},{\"name\":\"Heidi\",\"age\":38,\"city\":\"San Antonio\"},{\"name\":\"Ivan\",\"age\":50,\"city\":\"San Diego\"},{\"name\":\"Laura\",\"age\":31,\"city\":\"Austin\"},{\"name\":\"Mallory\",\"age\":37,\"city\":\"Jacksonville\"},{\"name\":\"Nathan\",\"age\":42,\"city\":\"Fort Worth\"}]"
  )
})

test_that("{shinytest2} recording: Apply age >= 35 filter", {
  app <- AppDriver$new(name = "Apply age filter")
  app$set_inputs(filter_expression = "age >= 35")
  app$click("filter_btn")
  json_string_filtered <- app$get_value(output = "json_string")
  expect_equal(
    json_string_filtered,
    "[{\"name\":\"Charlie\",\"age\":35,\"city\":\"Los Angeles\"},{\"name\":\"David\",\"age\":40,\"city\":\"Chicago\"},{\"name\":\"Frank\",\"age\":45,\"city\":\"Phoenix\"},{\"name\":\"Heidi\",\"age\":38,\"city\":\"San Antonio\"},{\"name\":\"Ivan\",\"age\":50,\"city\":\"San Diego\"},{\"name\":\"Mallory\",\"age\":37,\"city\":\"Jacksonville\"},{\"name\":\"Nathan\",\"age\":42,\"city\":\"Fort Worth\"}]"
  )
})

test_that("{shinytest2} recording: Apply age == 50 filter", {
  app <- AppDriver$new(name = "Apply age filter")
  app$set_inputs(filter_expression = "age == 50")
  app$click("filter_btn")
  json_string_filtered <- app$get_value(output = "json_string")
  expect_equal(
    json_string_filtered,
    "[{\"name\":\"Ivan\",\"age\":50,\"city\":\"San Diego\"}]"
  )
})