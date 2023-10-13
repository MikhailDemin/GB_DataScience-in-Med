from pygismeteo import Gismeteo
import geopy
from tzwhere import tzwhere
import datetime
import pytz

def get_weather(city):
    gismeteo = Gismeteo()
    try:
        search_results = gismeteo.search.by_query(city)
        # print(search_results)
        city_id = search_results[0].id
        current = gismeteo.current.by_id(city_id)
        # print(current.temperature.air.c)
        return "Погода в " + city + " " + str(current.temperature.air.c) + "С градусов"
    except Exception as ex:
        print(ex)
        return "Город " + city + " не найден"

def get_time(city):
    timezone_str = ""
    geo = geopy.geocoders.Nominatim(user_agent="SuperMon_Bot")
    location = geo.geocode(city)
    # print(location)
    try:
        tzw = tzwhere.tzwhere()
        # print(tzw)
        timezone_str = tzw.tzNameAt(location.latitude, location.longitude)
        tz = pytz.timezone(timezone_str)
        vremya_goroda = datetime.datetime.now(tz)
        # print(vremya_goroda.hour, vremya_goroda.minute)
    except Exception as ex:
        print(ex)
        return "Город " + city + " не найден"

    return "Время в городе " + city + " " + str(str(vremya_goroda.hour) + ":" + str(vremya_goroda.minute)) + ""