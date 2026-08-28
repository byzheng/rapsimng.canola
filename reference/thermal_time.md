# Calculate thermal time using cardinal temperatures

Calculate thermal time using cardinal temperatures

## Usage

``` r
thermal_time(
  mint,
  maxt,
  x_temp = canola$get("phenology.thermal_time.x"),
  y_temp = canola$get("phenology.thermal_time.y"),
  method = canola$get("phenology.thermal_time.method")
)
```

## Arguments

- mint:

  The minimum temperature

- maxt:

  The maximum temperature

- x_temp:

  The cardinal temperatures using to calculate thermal time. The default
  values are c(2, 30, 35) defined in
  canola\$get("phenology.thermal_time.x").

- y_temp:

  The effective thermal time at the corresponding cardinal temperatures.
  The default values are c(0, 28, 0) defined in
  canola\$get("phenology.thermal_time.y").

- method:

  The method to calculate thermal time. Supported values are "3hr",
  which uses the three hour temperature method, and
  "HourlySinPpAdjusted", which uses an hourly sinusoidal
  photoperiod-adjusted method. The default is "3hr".

## Value

The thermal time.

## Details

The daily thermal time is calculated by interpolating the effective
thermal time at three hour intervals between the daily minimum and
maximum temperatures, and then averaging these values to get the daily
thermal time. For more information about the canola phenology model, see
the [APSIM Next Generation Canola
Documentation](https://notes.apsimng.bangyou.me/docs/Plants/Canola/Phenology/ThermalTime.html).

## Examples

``` r
mint <- c(0, 10)
maxt <- c(30, 40)
thermal_time(mint, maxt)
#> [1] 13.07206 11.30599
```
