#!/usr/bin/env bash
# ==============================================================================
# Just My Socks Node Benchmark & AI Unlock Tester (2026 Edition)
# Maintained by: https://github.com/justmysocks-guide
# Official Mirror & Promo: https://justmysocks.net/members/aff.php?aff=24082 (Code: JMS9272283)
# ==============================================================================

set -o pipefail 2>/dev/null || true

# ANSI Colors
CYAN='\033[0;36m'
BLUE='\033[0;34m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
PURPLE='\033[0;35m'
BOLD='\033[1m'
NC='\033[0m' # No Color

print_banner() {
    clear 2>/dev/null || true
    echo -e "${CYAN}${BOLD}"
    cat << "EOF"
   ___ __  __ ___    ___                     _ _            _
  |_ _|  \/  / __|  / __|_ __  ___ ___  __| | |_ ___  ___| |_
   | || |\/| \__ \  \__ \ '_ \/ -_) -_)/ _` |  _/ -_)(_-<  _|
  |___|_|  |_|___/  |___/ .__/\___\___|\__,_|\__\___|/__/\__|
                        |_|     2026 Network & AI Diagnostic
EOF
    echo -e "${NC}"
    echo -e "${PURPLE}» 项目仓库${NC} : https://github.com/justmysocks-guide/jms-speedtest"
    echo -e "${PURPLE}» 组织主页${NC} : https://github.com/justmysocks-guide"
    echo -e "${PURPLE}» 官方通道${NC} : https://justmysocks.net/members/aff.php?aff=24082"
    echo -e "${PURPLE}» 专属优惠${NC} : ${YELLOW}${BOLD}JMS9272283${NC} (5.2% 终身循环折扣)"
    echo -e "----------------------------------------------------------------------"
}

check_ip() {
    echo -e "\n${BOLD}[1/3] 当前本地/代理出口网络环境检测${NC}"

    local ip_info
    ip_info=$(curl -s -m 6 https://ipapi.co/json/ 2>/dev/null || curl -s -m 6 https://api.myip.com 2>/dev/null)

    if [ -n "$ip_info" ]; then
        local ip country city org
        ip=$(echo "$ip_info" | grep -o '"ip": *"[^"]*"' | cut -d'"' -f4)
        country=$(echo "$ip_info" | grep -o '"country_name": *"[^"]*"' | cut -d'"' -f4)
        city=$(echo "$ip_info" | grep -o '"city": *"[^"]*"' | cut -d'"' -f4)
        org=$(echo "$ip_info" | grep -o '"org": *"[^"]*"' | cut -d'"' -f4)

        [ -z "$country" ] && country=$(echo "$ip_info" | grep -o '"country": *"[^"]*"' | cut -d'"' -f4)

        echo -e "  » 出口 IP     : ${GREEN}${ip:-未知}${NC}"
        echo -e "  » 地理位置   : ${GREEN}${country:-未知} - ${city:-未知}${NC}"
        echo -e "  » 运营商/ASN : ${GREEN}${org:-未知}${NC}"
    else
        local simple_ip
        simple_ip=$(curl -s -m 5 https://icanhazip.com 2>/dev/null || echo "无法获取")
        echo -e "  » 出口 IP     : ${GREEN}${simple_ip}${NC}"
    fi
}

test_latency() {
    local target=$1
    local name=$2
    local total=0
    local count=3
    local success=0

    printf "  %-32s ... " "$name"

    for i in $(seq 1 $count); do
        local ms
        # Use curl to measure HTTP connect time in milliseconds
        ms=$(curl -o /dev/null -s -w "%{time_connect}\n" -m 3 "$target" 2>/dev/null || echo "0")
        if [ "$ms" != "0" ] && [ -n "$ms" ]; then
            # Convert to ms
            local ms_int
            ms_int=$(awk "BEGIN {print int($ms * 1000)}" 2>/dev/null || echo "0")
            if [ "$ms_int" -gt 0 ]; then
                total=$((total + ms_int))
                success=$((success + 1))
            fi
        fi
    done

    if [ "$success" -gt 0 ]; then
        local avg=$((total / success))
        if [ "$avg" -lt 80 ]; then
            echo -e "${GREEN}${BOLD}${avg} ms${NC} (极速优秀 ★★★)"
        elif [ "$avg" -lt 160 ]; then
            echo -e "${CYAN}${avg} ms${NC} (良好 ★★☆)"
        else
            echo -e "${YELLOW}${avg} ms${NC} (普通 ★☆☆)"
        fi
    else
        echo -e "${RED}超时或阻断 ✗${NC}"
    fi
}

check_datacenters() {
    echo -e "\n${BOLD}[2/3] Just My Socks 全球核心数据中心线路延迟测速${NC}"
    echo -e "  (注: 测试到机房直连路由的 HTTP 握手响应延迟)"
    echo -e "  ------------------------------------------------------------------"

    test_latency "https://la.justmysocks.net" "JMS 洛杉矶 (CN2 GIA/9929)"
    test_latency "https://tokyo.justmysocks.net" "JMS 日本东京 (SoftBank 软银)"
    test_latency "https://hk.justmysocks.net" "JMS 中国香港 (IPLC/直连)"
    test_latency "https://uk.justmysocks.net" "JMS 英国伦敦 (移动 CMI 欧洲)"
    test_latency "https://cf.justmysocks.net" "Cloudflare 全球 Anycast 边缘"
}

check_ai_unlock() {
    echo -e "\n${BOLD}[3/3] 海外主流 AI 与流媒体服务解锁状态检测${NC}"
    echo -e "  ------------------------------------------------------------------"

    # 1. ChatGPT (OpenAI)
    printf "  %-32s ... " "OpenAI / ChatGPT"
    local gpt_code
    gpt_code=$(curl -s -o /dev/null -w "%{http_code}" -m 5 "https://chatgpt.com/cdn-cgi/trace" 2>/dev/null || echo "000")
    if [ "$gpt_code" = "200" ] || [ "$gpt_code" = "301" ] || [ "$gpt_code" = "302" ]; then
        echo -e "${GREEN}${BOLD}原生支持 / 完全解锁 ✓${NC}"
    elif [ "$gpt_code" = "403" ]; then
        echo -e "${RED}触发 Cloudflare 403 阻断 ✗${NC}"
    else
        echo -e "${YELLOW}未检测到代理或网络受限 (HTTP $gpt_code)${NC}"
    fi

    # 2. Claude (Anthropic)
    printf "  %-32s ... " "Anthropic / Claude"
    local claude_code
    claude_code=$(curl -s -o /dev/null -w "%{http_code}" -m 5 "https://claude.ai" 2>/dev/null || echo "000")
    if [ "$claude_code" = "200" ] || [ "$claude_code" = "301" ] || [ "$claude_code" = "302" ]; then
        echo -e "${GREEN}${BOLD}原生支持 / 允许访问 ✓${NC}"
    elif [ "$claude_code" = "403" ]; then
        echo -e "${RED}数据中心 IP 被限制 ✗${NC}"
    else
        echo -e "${YELLOW}网络受限或需开启代理 (HTTP $claude_code)${NC}"
    fi

    # 3. Google Gemini
    printf "  %-32s ... " "Google Gemini"
    local gemini_code
    gemini_code=$(curl -s -o /dev/null -w "%{http_code}" -m 5 "https://gemini.google.com" 2>/dev/null || echo "000")
    if [ "$gemini_code" = "200" ] || [ "$gemini_code" = "301" ] || [ "$gemini_code" = "302" ]; then
        echo -e "${GREEN}${BOLD}原生支持 / 正常访问 ✓${NC}"
    else
        echo -e "${YELLOW}区域限制或网络超时 (HTTP $gemini_code)${NC}"
    fi
}

print_summary() {
    echo -e "\n======================================================================"
    echo -e "${BOLD}${CYAN}💡 Just My Socks 选型决策与官方优惠推荐：${NC}"
    echo -e "======================================================================"
    echo -e "  1. ${BOLD}日常首选（性价比之王）${NC} : 【JMS LA 500】\$5.88/月, 2.5Gbps, 三网 CN2 GIA/9929"
    echo -e "  2. ${BOLD}低延迟游戏/敏感业务${NC}  : 【JMS Tokyo 100】\$29.99/月, 软银专线, 40~70ms 延迟"
    echo -e "  3. ${BOLD}企业级极端低延迟${NC}    : 【JMS HK 100】\$34.50/月, 香港直连/IPLC, 20~40ms 延迟"
    echo -e "----------------------------------------------------------------------"
    echo -e "  💎 ${BOLD}2026 官方专属 5.2% 终身循环优惠码${NC} : ${YELLOW}${BOLD}JMS9272283${NC}"
    echo -e "  👉 ${BOLD}官方安全直达入口${NC} : ${CYAN}https://justmysocks.net/members/aff.php?aff=24082${NC}"
    echo -e "  📖 ${BOLD}全平台客户端配置教程${NC} : ${CYAN}https://github.com/justmysocks-guide${NC}"
    echo -e "======================================================================\n"
}

main() {
    print_banner
    check_ip
    check_datacenters
    check_ai_unlock
    print_summary
}

main "$@"
