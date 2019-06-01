#!/usr/bin/env python3
# Adapted from https://github.com/cavebeat/gandi-live-dns/blob/master/src/gandi-live-dns.py

import requests, json
import config


def get_uuid():
    ''' 
    find out ZONE UUID from domain
    Info on domain "DOMAIN"
    GET /domains/<DOMAIN>:
    '''
    url = f'{config.api_endpoint}/domains/{config.domain}'
    u = requests.get(url, headers={"X-Api-Key" : config.api_secret})
    json_object = json.loads(u._content)
    if u.status_code == 200:
        return json_object['zone_uuid']
    else:
        print('Error when retrieving uuid')
        exit()

def get_dns_record(uuid, record):
    ''' find out IP from first Subdomain DNS-Record
    List all records with name "NAME" and type "TYPE" in the zone UUID
    GET /zones/<UUID>/records/<NAME>/<TYPE>:
    
    The first subdomain from config.subdomain will be used to get   
    the actual DNS Record IP
    '''
    url = f'{config.api_endpoint}/zones/{uuid}/records/{config.subdomains[0]}/{record}'
    headers = {"X-Api-Key":config.api_secret}
    u = requests.get(url, headers=headers)
    if u.status_code == 200:
        json_object = json.loads(u._content)
        return json_object['rrset_values'][0]
    else:
        print('Error when retrieving DNS records')
        print(u.text)
        exit()

def update_records(uuid, dynIP, subdomain, record):
    ''' update DNS Records for Subdomains 
        Change the "NAME"/"TYPE" record from the zone UUID
        PUT /zones/<UUID>/records/<NAME>/<TYPE>:
        curl -X PUT -H "Content-Type: application/json" \
                    -H 'X-Api-Key: XXX' \
                    -d '{"rrset_ttl": 10800,
                         "rrset_values": ["<VALUE>"]}' \
                    https://dns.gandi.net/api/v5/zones/<UUID>/records/<NAME>/<TYPE>
    '''
    url = f'{config.api_endpoint}/zones/{uuid}/records/{subdomain}/{record}'
    payload = {"rrset_ttl": config.ttl, "rrset_values": [dynIP]}
    headers = {"Content-Type": "application/json", "X-Api-Key":config.api_secret}
    u = requests.put(url, data=json.dumps(payload), headers=headers)
    json_object = json.loads(u._content)

    if u.status_code == 201:
        return True
    else:
        print(f'Error when updating uuid - code {u.status_code}')
        exit()

def get_public_ips():
    '''
    Retrieve ipv4 and ipv6 addresses
    '''
    r_v4 = requests.get('https://api.ipify.org?format=json')
    r_v6 = requests.get('https://api6.ipify.org?format=json')
    if r_v4.status_code == 200:
        ipv4 = r_v4.json()["ip"]
    if r_v6.status_code == 200:
        ipv6 = r_v6.json()["ip"]
    return [ipv4, ipv6]

if __name__ == '__main__':
    uuid = get_uuid()
    [ipv4, ipv6] = get_public_ips()
    for sub in config.subdomains:
        print(config.api_endpoint+ '/zones/' + uuid + '/records/' + sub + '/A')
        if ipv4 != '' and ipv4 != get_dns_record(uuid, 'A'):
            print(f"UPDATE v4 to {ipv4}")
            #update_records(uuid, ipv4, sub, 'A')
        if ipv6 != '' and ipv6 != get_dns_record(uuid, 'AAAA'):
            print(f"UPDATE v6 to {ipv6}")
            #update_records(uuid, ipv6, sub, 'AAAA')
