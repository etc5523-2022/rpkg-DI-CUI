test_that("mean work", {
  expect_equal(calculate_country_alcohol("China", "beer_servings")[[1]], "mean: 79")
})

test_that("diff work", {
  expect_equal(calculate_country_alcohol("China", "beer_servings")[[2]]$diff, 0)
})
