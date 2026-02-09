thermaltime_validator <- function(value) {
    if (!is.list(value) || !all(c("x", "y") %in% names(value))) {
        stop("thermaltime must be a list with both x and y")
    }
    if (length(value$x) != length(value$y)) stop("thermaltime x and y must have same length")
}

#' Canola model options manager
#'
#' An options manager for configuring canola model parameters. This object provides
#' methods to get and set canola related parameters.
#'
#' @section Available Options:
#' \describe{
#'   \item{phenology.thermal_time.x}{Cardinal temperatures for thermal time calculation. Default: c(2, 30, 35)}
#'   \item{phenology.thermal_time.y}{Effective thermal time at corresponding cardinal temperatures. Default: c(0, 28, 0)}
#'   \item{phenology.vernalisation_time.x}{Cardinal temperatures for vernalisation time calculation. Default: c(0, 2, 8, 15)}
#'   \item{phenology.vernalisation_time.y}{Effective vernalisation time at corresponding cardinal temperatures. Default: c(0, 1, 0.5, 0.0)}
#' }
#'
#' @section Methods:
#' \describe{
#'   \item{get(key)}{Retrieve the value of an option by its key (e.g., "phenology.thermal_time.x")}
#'   \item{set(key, value)}{Set the value of an option by its key}
#'   \item{reset()}{Reset all options to their default values}
#' }
#'
#' @export
#' @importFrom optree create_options_manager
#' @examples
#' # Get default thermal time cardinal temperatures
#' canola$get("phenology.thermal_time.x")
#' 
#' # Get default vernalisation time parameters
#' canola$get("phenology.vernalisation_time.x")
#' canola$get("phenology.vernalisation_time.y")
#' 
#' # Set custom values
#' canola$set("phenology.thermal_time.x" = c(0, 25, 40))
#' canola$set("phenology.thermal_time.y" = c(0, 25, 0))
#' 
#' # Reset to defaults
#' canola$reset()
canola <- optree::create_options_manager(
    defaults = list(
        phenology = list(
            thermal_time = list(
                x = c(2, 30, 35),
                y = c(0, 28, 0)
            ),
            vernalisation_time = list(
                x = c(0, 2, 8, 15),
                y = c(0, 1, 0.5, 0.0)
            )
        )
    ),
    validators = list(
        "phenology.thermal_time" = thermaltime_validator,
        "phenology.vernalisation_time" = thermaltime_validator
    )
)
