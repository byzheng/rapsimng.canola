
#' Calculate thermal time using cardinal temperatures
#'
#' @details 
#' The daily thermal time is calculated by interpolating the effective thermal time at three hour intervals between the daily minimum and maximum temperatures, and then averaging these values to get the daily thermal time.
#' For more information about the canola phenology model, see the 
#' [APSIM Next Generation Canola Documentation](https://apsimng-notes.bangyou.me/docs/Plants/Canola/Phenology/ThermalTime.html).
#' 
#' @param maxt The maximum temperature
#' @param mint The minimum temperature
#' @param x_temp The cardinal temperatures using to calculate thermal time. The default values are c(2, 30, 35) defined in canola$get("phenology.thermal_time.x").
#' @param y_temp The effective thermal time at the corresponding cardinal temperatures. The default values are c(0, 28, 0) defined in canola$get("phenology.thermal_time.y").
#' @param method The method to calculate thermal time. The default method is "3hr", which uses the three hour temperature method. The other option is "default", which uses the default method ( maxt + mint ) / 2 - base.
#' @return The thermal time.
#' @export
#' @examples 
#' mint <- c(0, 10)
#' maxt <- c(30, 40)
#' thermal_time(mint, maxt)
thermal_time <- function(mint, 
        maxt,
        x_temp = canola$get("phenology.thermal_time.x"), 
        y_temp = canola$get("phenology.thermal_time.y"),
        method = "3hr") {
    tidyweather::thermal_time(mint, maxt, x_temp, y_temp, method)
}
