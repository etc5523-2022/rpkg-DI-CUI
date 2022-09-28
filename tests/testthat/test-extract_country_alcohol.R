test_that("extract work", {
  expect_equal(nrow(extract_country_servings(c(1,2),"beer_servings")), 5)
})
