
test_that("get returns correct default values", {
    expect_equal(canola$get("phenology.thermal_time.x"), c(2, 30, 35))
    expect_equal(canola$get("phenology.thermal_time.y"), c(0, 28, 0))
})

test_that("set updates values correctly", {
    canola$set(phenology = list(thermal_time = list(x = c(5, 25, 40), y = c(0, 20, 0))))
    expect_equal(canola$get("phenology.thermal_time.x"), c(5, 25, 40))
    expect_equal(canola$get("phenology.thermal_time.y"), c(0, 20, 0))
})

test_that("set enforces group validation", {
    # Missing y
    expect_no_error(
        canola$set(phenology = list(thermal_time = list(x = c(1, 2, 3))))
    )

    # x and y different length
    expect_error(
        canola$set(phenology = list(thermal_time = list(x = c(1, 2), y = c(0, 1, 2)))),
        "thermaltime x and y must have same length"
    )
})

test_that("reset restores defaults", {
    canola$reset()
    expect_equal(canola$get("phenology.thermal_time.x"), c(2, 30, 35))
    expect_equal(canola$get("phenology.thermal_time.y"), c(0, 28, 0))
})
