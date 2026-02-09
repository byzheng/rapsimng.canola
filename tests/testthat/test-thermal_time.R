test_that("Thermal time", {
    old <- options(digits = 20)
    # The daily thermal time
    mint <- c(0, 10)
    maxt <- c(30, 40)
    res <- thermal_time(mint, maxt)
    expect_equal(res, c(13.07, 11.31), tolerance=1e-3)
    
    #expect_equal(res$value[1], 16.391951095089993, tolerance=1e-3)
    # Read weather records
    met_file <- system.file("extdata/ppd_72150.met", package = "tidyweather")
    records <- tidyweather::read_weather(met_file)
    res <- thermal_time(records$mint, records$maxt)
    expect_equal(round(res[1], 1), 19.6, tolerance=1e-3)
    options(old)
})
