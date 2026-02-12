# Run:
# python geo.py

# https://github.com/P3TERX/GeoLite.mmdb

# wget https://git.io/GeoLite2-ASN.mmdb
# wget https://git.io/GeoLite2-City.mmdb
# pip install geoip2

import geoip2.database
import ipaddress

def get_ip_details(ip_address, city_db_path, asn_db_path):
    try:
        # Работаем с базой ASN (для провайдера и CIDR)
        with geoip2.database.Reader(asn_db_path) as asn_reader:
            asn_data = asn_reader.asn(ip_address)
            network = asn_data.network  # Объект ipaddress.IPv4Network
            
            print(f"IP: {ip_address}")
            print(f"IP диапазон: {network[0]} - {network[-1]}")
            print(f"CIDR: {network}")
            print(f"Название провайдера: {asn_data.autonomous_system_organization}")

        # Работаем с базой City (для геолокации, если нужно)
        with geoip2.database.Reader(city_db_path) as city_reader:
            city_data = city_reader.city(ip_address)
            print(f"Локация: {city_data.country.name}, {city_data.city.name}")

    except Exception as e:
        print(f"Ошибка: {e}")

# Пути к вашим файлам баз данных
CITY_DB = 'GeoLite2-City.mmdb'
ASN_DB = 'GeoLite2-ASN.mmdb'

get_ip_details("1.2.3.4", CITY_DB, ASN_DB)
