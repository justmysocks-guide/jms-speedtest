#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Just My Socks Multi-datacenter Benchmark & AI Unlock Diagnostic (2026)
Maintained by: https://github.com/justmysocks-guide
Official Mirror: https://justmysocks.net/members/aff.php?aff=24082
Promo Code: JMS9272283 (5.2% Lifetime Recurring)
"""

import sys
import time
import json
import urllib.request
import urllib.error

# ANSI color codes
CYAN = "\033[0;36m"
GREEN = "\033[0;32m"
YELLOW = "\033[1;33m"
RED = "\033[0;31m"
PURPLE = "\033[0;35m"
BOLD = "\033[1m"
RESET = "\033[0m"

BANNER_TEMPLATE = r"""
   ___ __  __ ___    ___                     _ _            _
  |_ _|  \/  / __|  / __|_ __  ___ ___  __| | |_ ___  ___| |_
   | || |\/| \__ \  \__ \ '_ \/ -_) -_)/ _` |  _/ -_)(_-<  _|
  |___|_|  |_|___/  |___/ .__/\___\___|\__,_|\__\___|/__/\__|
                        |_|     2026 Network & AI Diagnostic
"""

def print_banner():
    print(f"{CYAN}{BOLD}{BANNER_TEMPLATE}{RESET}")
    print(f"  {PURPLE}GitHub Org{RESET}   : https://github.com/justmysocks-guide")
    print(f"  {PURPLE}Repo{RESET}         : https://github.com/justmysocks-guide/jms-speedtest")
    print(f"  {PURPLE}Official Link{RESET}: https://justmysocks.net/members/aff.php?aff=24082")
    print(f"  {PURPLE}Promo Code{RESET}   : {YELLOW}{BOLD}JMS9272283{RESET} (5.2% Lifetime Discount)")
    print("----------------------------------------------------------------------")

def get_outbound_ip():
    print(f"\n{BOLD}[1/3] Outbound IP & Network Geolocation Check{RESET}")
    services = [
        "https://ipapi.co/json/",
        "https://api.myip.com",
    ]
    for url in services:
        try:
            req = urllib.request.Request(url, headers={"User-Agent": "curl/7.88.1"})
            with urllib.request.urlopen(req, timeout=5) as response:
                data = json.loads(response.read().decode("utf-8"))
                ip = data.get("ip", "Unknown")
                country = data.get("country_name") or data.get("country", "Unknown")
                city = data.get("city", "")
                org = data.get("org", data.get("asn", "Unknown"))
                print(f"  » Outbound IP  : {GREEN}{ip}{RESET}")
                print(f"  » Location     : {GREEN}{country} {city}{RESET}")
                print(f"  » ISP / ASN    : {GREEN}{org}{RESET}")
                return
        except Exception:
            continue
    print(f"  » Outbound IP  : {YELLOW}Direct request timed out (Proxy active?){RESET}")

def measure_latency(name, url):
    sys.stdout.write(f"  {name:<34} ... ")
    sys.stdout.flush()

    times = []
    for _ in range(3):
        start = time.time()
        try:
            req = urllib.request.Request(url, headers={"User-Agent": "curl/7.88.1"})
            with urllib.request.urlopen(req, timeout=3) as resp:
                _ = resp.read(100)
                times.append((time.time() - start) * 1000)
        except Exception:
            pass

    if times:
        avg = int(sum(times) / len(times))
        if avg < 80:
            badge = f"{GREEN}{BOLD}{avg} ms{RESET} (Ultra Fast ★★★)"
        elif avg < 160:
            badge = f"{CYAN}{avg} ms{RESET} (Good ★★☆)"
        else:
            badge = f"{YELLOW}{avg} ms{RESET} (Moderate ★☆☆)"
        print(badge)
    else:
        print(f"{RED}Timeout / Blocked ✗{RESET}")

def check_datacenters():
    print(f"\n{BOLD}[2/3] Just My Socks Datacenter Handshake Latency{RESET}")
    targets = [
        ("JMS Los Angeles (CN2 GIA/9929)", "https://la.justmysocks.net"),
        ("JMS Tokyo (SoftBank Line)", "https://tokyo.justmysocks.net"),
        ("JMS Hong Kong (Direct/IPLC)", "https://hk.justmysocks.net"),
        ("JMS London (UK CMI Route)", "https://uk.justmysocks.net"),
        ("Cloudflare Anycast Edge", "https://cf.justmysocks.net"),
    ]
    for name, url in targets:
        measure_latency(name, url)

def test_ai_unlock():
    print(f"\n{BOLD}[3/3] AI & Streaming Platform Accessibility Test{RESET}")
    ai_targets = [
        ("OpenAI / ChatGPT", "https://chatgpt.com/cdn-cgi/trace"),
        ("Anthropic / Claude", "https://claude.ai"),
        ("Google Gemini", "https://gemini.google.com"),
    ]
    for name, url in ai_targets:
        sys.stdout.write(f"  {name:<34} ... ")
        sys.stdout.flush()
        try:
            req = urllib.request.Request(url, headers={"User-Agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7)"})
            with urllib.request.urlopen(req, timeout=5) as resp:
                code = resp.getcode()
                if code in (200, 301, 302):
                    print(f"{GREEN}{BOLD}Native Clean IP / Unlocked ✓{RESET}")
                elif code == 403:
                    print(f"{RED}Cloudflare / IP 403 Blocked ✗{RESET}")
                else:
                    print(f"{YELLOW}HTTP {code}{RESET}")
        except urllib.error.HTTPError as e:
            if e.code == 403:
                print(f"{RED}Datacenter IP Restricted (403) ✗{RESET}")
            else:
                print(f"{YELLOW}HTTP Error {e.code}{RESET}")
        except Exception:
            print(f"{YELLOW}Network Timeout or Route Restricted{RESET}")

def print_summary():
    print("\n" + "=" * 70)
    print(f"{BOLD}{CYAN}💡 Recommended Plans & Official Discount Guide:{RESET}")
    print("=" * 70)
    print(f"  1. {BOLD}Best Budget Choice{RESET}      : [JMS LA 500] $5.88/mo, 2.5Gbps, CN2 GIA/9929")
    print(f"  2. {BOLD}Low Latency Gaming{RESET}      : [JMS Tokyo 100] $29.99/mo, SoftBank, 40~70ms")
    print(f"  3. {BOLD}Enterprise IPLC{RESET}         : [JMS HK 100] $34.50/mo, Hong Kong, 20~40ms")
    print("-" * 70)
    print(f"  💎 {BOLD}5.2% Lifetime Discount Code{RESET} : {YELLOW}{BOLD}JMS9272283{RESET}")
    print(f"  👉 {BOLD}Official Store Portal{RESET}       : {CYAN}https://justmysocks.net/members/aff.php?aff=24082{RESET}")
    print(f"  📖 {BOLD}Complete Setup Tutorial{RESET}     : {CYAN}https://github.com/justmysocks-guide{RESET}")
    print("=" * 70 + "\n")

def main():
    print_banner()
    get_outbound_ip()
    check_datacenters()
    test_ai_unlock()
    print_summary()

if __name__ == "__main__":
    main()
