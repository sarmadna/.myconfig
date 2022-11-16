#!/usr/bin/env python

import webbrowser

def main():
    extensions = [
        "https://extensions.gnome.org/extension/36/lock-keys/",
        "https://extensions.gnome.org/extension/517/caffeine/",
        "https://extensions.gnome.org/extension/19/user-themes/",
        "https://extensions.gnome.org/extension/7/removable-drive-menu/",
        "https://extensions.gnome.org/extension/615/appindicator-support/"
    ]
    for x in extensions:
        webbrowser.open_new_tab(x)
        print(x)

if __name__ == "__main__":
    main()
