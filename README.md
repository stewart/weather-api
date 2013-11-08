# Weather-API

A Ruby wrapper for the Yahoo! Weather XML RSS feed.

## Installation

    [sudo] gem install weather-api

## Description

Weather-API provides an object-oriented interface to the Yahoo! Weather XML RSS
feed service.

Details on the service can be found [here](http://developer.yahoo.com/weather).

## Usage

A simple example:

    require 'rubygems'
    require 'weather-api'

    # look up WOEID via http://weather.yahoo.com; enter location by city
    # name or zip and WOEID is at end of resulting page url.
    response = Weather.lookup(9830, Weather::Units::CELSIUS)

    print <<EOT
    #{response.title}
    #{response.condition.temp} degrees
    #{response.condition.text}
    EOT

This produces:

     Conditions for Ladysmith, CA at 5:00 pm PDT
     13 degrees
     Cloudy

## Copyright

Copyright (c) 2012 Andrew Stewart. See `LICENSE` file for more details.
