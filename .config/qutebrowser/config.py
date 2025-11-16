config.load_autoconfig(False)


## THEMES

#Catppuccin
# import catppuccin
# catppuccin.setup(c, 'mocha',True)

#Dracula
import dracula.draw
dracula.draw.blood(c,{
    'spacing':{
        'vertical':0,
        'horizontal':1
    }
})

#OneDark
# import onedark 
# onedark.setup(c)

##########

c.aliases = {'q':'quit','w':'session-save','wq':'quit --save'}
config.set("colors.webpage.preferred_color_scheme","dark") # Request web pages for a dark mode
# config.set('colors.webpage.darkmode.enabled', True) # Force dark mode across all websites
config.set('content.cookies.accept', 'all', 'chrome-devtools://*')
config.set('content.notifications.enabled', True, 'https://www.reddit.com')
config.set('content.notifications.enabled', True, 'https://www.youtube.com')
config.set('content.notifications.enabled', True, 'https://web.whatsapp.com')
c.url.default_page = 'https://www.google.com'
c.url.start_pages = 'https://www.google.com'
c.downloads.location.directory = '~/Downloads'
c.url.searchengines = {
    'DEFAULT': 'https://www.google.com/search?q={}',
    'am': 'https://www.amazon.in/s?k={}',
    'aw': 'https://wiki.archlinux.org/?search={}',
    'duck': 'https://duckduckgo.com/?q={}',
    're': 'https://www.reddit.com/r/{}',
    'ub': 'https://www.urbandictionary.com/define.php?term={}',
    'wiki': 'https://en.wikipedia.org/wiki/{}',
    'yt': 'https://www.youtube.com/results?search_query={}'
}
c.fonts.default_family = '"JetBrains Mono"'
c.fonts.default_size = '10pt'
# Bindings for normal mode
config.bind('xb','config-cycle statusbar.show never always')
config.bind('xt','config-cycle tabs.show never always')
config.bind('xx','config-cycle statusbar.show never always;; config-cycle tabs.show never always')

