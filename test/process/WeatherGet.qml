pragma Singleton

import QtQuick
import Quickshell

Singleton {
    id: root
    
    property string weatherData: ""
    property string temperature: ""
    property string weatherIcon: ""
    property bool loading: false
    
    readonly property string apiKey: "e434b5435a979de6e155570590bee89b"
    readonly property string city: "Gdynia"
    readonly property string units: "metric"
    readonly property string symbol: "°"
    
    function getWeatherIcon(iconCode) {
        const icons = {
            "01d": "󰖙", // Clear day
            "01n": "󰖔", // Clear night
            "02d": "󰖕", // Partly cloudy day
            "02n": "󰼱", // Partly cloudy night
            "03d": "󰖐", // Cloudy day
            "03n": "󰖐", // Cloudy night
            "04d": "󰖐", // Overcast
            "04n": "󰖐", // Overcast
            "09d": "󰖗", // Showers
            "09n": "󰖗", // Showers
            "10d": "󰖖", // Rain day
            "10n": "󰖖", // Rain night
            "11d": "󰖓", // Thunderstorm
            "11n": "󰖓", // Thunderstorm
            "13d": "󰖘", // Snow
            "13n": "󰖘", // Snow
            "50d": "󰖑", // Mist
            "50n": "󰖑"  // Mist
        };        
        return icons[iconCode] || ""; // Default unknown
    }
    
    function fetchWeather() {
        if (loading) return;
        
        loading = true;
        const url = `https://api.openweathermap.org/data/2.5/weather?appid=${apiKey}&q=${city}&units=${units}`;
        
        const process = Qt.createQmlObject(`
            import QtQuick
            import Quickshell.Io
            
            Process {
                command: ["curl", "-sf", "${url}"]
                stdout: StdioCollector {
                    onStreamFinished: {
                        try {
                            const data = JSON.parse(this.text);
                            if (data.main && data.weather) {
                                root.temperature = Math.round(data.main.temp).toString();
                                root.weatherIcon = root.getWeatherIcon(data.weather[0].icon);
                                root.weatherData = root.temperature + "\\n" + root.symbol + root.weatherIcon;
                            } else {
                                console.log("Invalid weather data received");
                                root.weatherData = "N/A";
                            }
                        } catch (e) {
                            console.log("Error parsing weather data:", e);
                            root.weatherData = "Error";
                        }
                        root.loading = false;
                        parent.destroy();
                    }
                }
                stderr: StdioCollector {
                    onStreamFinished: {
                        if (this.text) {
                            console.log("Weather fetch error:", this.text);
                            root.weatherData = "Error";
                            root.loading = false;
                        }
                        parent.destroy();
                    }
                }
            }
        `, root);
        
        process.running = true;
    }
    
    Component.onCompleted: {
        fetchWeather();
    }
    
    Timer {
        interval: 30000 // 30 seconds
        running: true
        repeat: true
        onTriggered: root.fetchWeather()
    }
}
