import 'package:agrosage/model/weather.dart';
import 'package:flutter/material.dart';

List<Weather> weatherData = [
  const Weather(icon: Icons.thermostat, label: 'Temprature', value: '24', units: '°C'),
  const Weather(icon: Icons.cloud, label: 'Precipitation', value: '28', units: 'MM'),
  const Weather(icon: Icons.water, label: 'Humidity', value: '58', units: '%'),
  const Weather(icon: Icons.wind_power, label: 'Wind Speed', value: '24', units: 'Km/h'),
];