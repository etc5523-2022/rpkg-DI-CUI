test_that("mean work", {
  expect_equal(calculate_country_alcohol("China", "beer_servings")[[1]], "global mean: 106.16 ;  mean: 79")
})

test_that("diff work", {
  expect_equal(calculate_country_alcohol("China", "beer_servings")[[2]]$diff, 0)
})

test_that("global diff work", {
  expect_equal(calculate_country_alcohol("China", "beer_servings")[[2]]$global_diff, -27.16)
})
