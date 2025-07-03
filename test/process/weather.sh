#!/bin/sh

get_icon() {
    case $1 in
        # Icons for weather-icons
        #01d) icon="";;
        #01n) icon="";;
        #02d) icon="";;
        #02n) icon="";;
        #03*) icon="";;
        #04*) icon="";;
        #09d) icon="";;
        #09n) icon="";;
        #10d) icon="";;
        #10n) icon="";;
        #11d) icon="";;
        #11n) icon="";;
        #13d) icon="";;
        #13n) icon="";;
        #50d) icon="";;
        #50n) icon="";;
        #*) icon="";

        #01d) icon="";;
        #01n) icon="";;
        #02d) icon="";;
        #02n) icon="";;
        #03d) icon="";;
        #03n) icon="";;
        #04*) icon="";;
        #09*) icon="";;
        #10d) icon="";;
        #10n) icon="";;
        #11*) icon="";;
        #13*) icon="";;
        #50*) icon="";;
        #*) icon="";

        # Icons for Nerd Fonts
        01d) icon="";;  # Clear day
        01n) icon="";;  # Clear night
        02d) icon="";;  # Partly cloudy day
        02n) icon="";;  # Partly cloudy night
        03d) icon="";;  # Cloudy day (scattered clouds)
        03n) icon="";;  # Cloudy night
        04*) icon="";;  # Overcast
        09*) icon="";;  # Showers
        10d) icon="";;  # Rain day
        10n) icon="";;  # Rain night
        11*) icon="";;  # Thunderstorm
        13*) icon="";;  # Snow
        50*) icon="";;  # Mist
        *) icon="";;    # Default (unknown)
    esac

    echo $icon
}

KEY="e434b5435a979de6e155570590bee89b"
CITY="Gdynia"
UNITS="metric"
SYMBOL="°"

API="https://api.openweathermap.org/data/2.5"

if [ -n "$CITY" ]; then
    if [ "$CITY" -eq "$CITY" ] 2>/dev/null; then
        CITY_PARAM="id=$CITY"
    else
        CITY_PARAM="q=$CITY"
    fi

    weather=$(curl -sf "$API/weather?appid=$KEY&$CITY_PARAM&units=$UNITS")
else
    location=$(curl -sf https://location.services.mozilla.com/v1/geolocate?key=geoclue)

    if [ -n "$location" ]; then
        location_lat="$(echo "$location" | jq '.location.lat')"
        location_lon="$(echo "$location" | jq '.location.lng')"

        weather=$(curl -sf "$API/weather?appid=$KEY&lat=$location_lat&lon=$location_lon&units=$UNITS")
    fi
fi

if [ -n "$weather" ]; then
    weather_temp=$(echo "$weather" | jq ".main.temp" | cut -d "." -f 1)
    weather_icon=$(echo "$weather" | jq -r ".weather[0].icon")

    echo -e "$weather_temp\n$SYMBOL$(get_icon "$weather_icon")"
fi
