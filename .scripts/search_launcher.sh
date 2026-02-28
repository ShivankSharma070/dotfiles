#!/usr/bin/env sh


dir="$HOME/.config/rofi/launchers/type-1"
theme='style-5'
browser="zen-browser"
options="Google
Yt-Youtube
Vtop
Web-Whatsapp
NeoCollab
Fast
ChatGpt
Pirate-proxy-bay
Himovies
Lovebabbar-DSA
Dropbox
Onedrive
Reddit
Monkeytype
Github
Build-Your-Own-X
Claude
Grok
Perplexity
"
# converting options to a array
arr=($options)

search_engine=$(echo -e "$options"| rofi -dmenu -i -p Search -theme ${dir}/${theme}.rasi )


#Check if search_engine is undefined or null
if [ -z $search_engine  ] ; then
    exit 1
fi

if [ $search_engine == ${arr[2]} ] ; then
    url="https://vtop.vit.ac.in/vtop/login"
elif [ $search_engine == ${arr[3]} ] ; then
    url="https://web.whatsapp.com/"
elif [ $search_engine == ${arr[4]} ] ; then
    google-chrome-stable "https://vitvellore312.examly.io/"
    exit 1
elif [ $search_engine == ${arr[5]} ] ; then
    url="https://fast.com"
elif [ $search_engine == ${arr[6]} ] ; then
    url="https://chatgpt.com"
elif [ $search_engine == ${arr[9]} ] ; then
    url="https://www.youtube.com/playlist?list=PLDzeHZWIZsTryvtXdMr6rPh4IDexB5NIA"
elif [ $search_engine == ${arr[10]} ] ; then
    url="https://www.dropbox.com/home"
elif [ $search_engine == ${arr[11]} ] ; then
    url="https://vitacin-my.sharepoint.com/my"
elif [ $search_engine == ${arr[12]} ] ; then
    url="https://www.reddit.com"
elif [ $search_engine == ${arr[13]} ] ; then
    url="https://monkeytype.com"
elif [ $search_engine == ${arr[14]} ] ; then
    url="https://www.github.com"
elif [ $search_engine == ${arr[15]} ] ; then
    url="https://github.com/codecrafters-io/build-your-own-x"
elif [ $search_engine == ${arr[16]} ] ; then
    url="https://claude.ai"
elif [ $search_engine == ${arr[17]} ] ; then
    url="https://grok.com"
elif [ $search_engine == ${arr[18]} ] ; then
    url="https://perplexity.ai"
else
    query=$(rofi -dmenu -i -p "Search $search_engine" -theme ${dir}/${theme}.rasi )
    #Check if query is undefined or null
    if [ -z $query  ] ; then
        if [[ $search_engine == "Yt-Youtube" ]]; then
           url="https://youtube.com"
        elif [[ $search_engine == "Himovies" ]]; then
           url="https://himovies.sx/home"
        elif [[ $search_engine == "Google" ]]; then
           url="https://google.com"
        else
          #By default set the input as the url 
          url=$search_engine
        fi

    else
    #generating url for choosed search_engine and query
    if [ $search_engine == ${arr[0]} ] ; then
        url="https://www.google.com/search?q=$query"
    elif [ $search_engine == ${arr[1]} ] ; then
        url="https://www.youtube.com/results?search_query=$query"
    elif [ $search_engine == ${arr[7]} ] ; then
        url="https://tpirbay.xyz/search/$query/1/99/0"
    elif [ $search_engine == ${arr[8]} ] ; then
        url="https://himovies.sx/search/${query// /-}"
    fi
    fi


fi
$browser --new-window "$url"
