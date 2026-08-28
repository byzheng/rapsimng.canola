
test_that("get returns correct default values", {
    expect_equal(canola$get("phenology.thermal_time.x"), c(2, 30, 35))
    expect_equal(canola$get("phenology.thermal_time.y"), c(0, 28, 0))
    expect_equal(canola$get("phenology.thermal_time.method"), "3hr")
})

test_that("set updates values correctly", {
    canola$set(phenology = list(thermal_time = list(x = c(5, 25, 40), y = c(0, 20, 0))))
    expect_equal(canola$get("phenology.thermal_time.x"), c(5, 25, 40))
    expect_equal(canola$get("phenology.thermal_time.y"), c(0, 20, 0))

    canola$set(phenology = list(thermal_time = list(method = "HourlySinPpAdjusted")))
    expect_equal(canola$get("phenology.thermal_time.method"), "HourlySinPpAdjusted")
})

test_that("set enforces group validation", {
    # Missing y
    expect_no_error(
        canola$set(phenology = list(thermal_time = list(x = c(1, 2, 3))))
    )

    # x and y different length
    expect_error(
        canola$set(phenology = list(thermal_time = list(x = c(1, 2), y = c(0, 1, 2))))
    )

    expect_error(
        canola$set(phenology = list(thermal_time = list(method = "default")))
    )
})

test_that("reset restores defaults", {
    canola$reset()
    expect_equal(canola$get("phenology.thermal_time.x"), c(2, 30, 35))
    expect_equal(canola$get("phenology.thermal_time.y"), c(0, 28, 0))
    expect_equal(canola$get("phenology.thermal_time.method"), "3hr")
})
