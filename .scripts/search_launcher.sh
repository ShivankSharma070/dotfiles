#!/usr/bin/env sh

browser="brave"

options="Google
Yt-Youtube
Vtop
Web-Whatsapp
NeoCollab
ChatGpt
Onedrive
Reddit
Monkeytype
Github
Build-Your-Own-X
Claude
Grok
Discord
Amazon
Flipkart
Myntra"

search_engine=$(echo -e "$options" | rofi -dmenu -i -p Search)

if [ -z "$search_engine" ]; then
    exit 1
fi

case "$search_engine" in
    "Google")      url_pattern="https://www.google.com/search?q=%s" ;;
    "Yt-Youtube") url_pattern="https://www.youtube.com/results?search_query=%s" ;;
    "Vtop")        url="https://vtop.vit.ac.in/vtop/login" ;;
    "Web-Whatsapp") url="https://web.whatsapp.com/" ;;
    "NeoCollab")   google-chrome-canary "https://vitvellore312.examly.io/" && exit 0 ;;
    "ChatGpt")     url="https://chatgpt.com" ;;
    "Onedrive")    url="https://vitacin-my.sharepoint.com/my" ;;
    "Reddit")      url="https://www.reddit.com" ;;
    "Monkeytype")  url="https://monkeytype.com" ;;
    "Github")      url="https://www.github.com" ;;
    "Build-Your-Own-X") url="https://github.com/codecrafters-io/build-your-own-x" ;;
    "Claude")      url="https://claude.ai" ;;
    "Grok")        url="https://grok.com" ;;
    "Discord")     url="https://discord.com/app" ;;
    "Amazon")      url="https://amazon.in" ;;
    "Flipkart")    url="https://flipkart.com" ;;
    "Myntra")      url="https://myntra.com" ;;
    *)             url="$search_engine" ;;
esac

if [ -n "$url" ]; then
    $browser "$url"
    exit 0
fi

query=$(rofi -dmenu -i -p "Search $search_engine")
# If there is no query provided -> open the home page of the website
if [ -z "$query" ]; then
    case "$search_engine" in
        "Yt-Youtube") url="https://youtube.com" ;;
        "Google") url="https://google.com" ;;
        *)            url="$search_engine" ;;
    esac
else
    case "$search_engine" in
        *)        url=$(echo "$url_pattern" | sed "s/%s/${query// /+}/g") ;;
    esac
fi

$browser --new-window "$url"
