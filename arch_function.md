### Init

- `sudo xbacklight -set 100`
- change 3 to `/sys/class/leds/asus::kbd_backlight/brightness/`
- `xinput set-prop 12 327 -0.8`
- wallpaper for lightdm mini `/etc/lightdm/deep_space_fullhd.jpg`
- go to [Cappuccin Grub](https://github.com/catppuccin/grub)
- ......................................................
- `xdg-settings set default-web-browser microsoft-edge.desktop`
- `nmcli device wifi connect SSID_or_BSSID password password`

```
COPY TO FOLLOWING PWD

~/.config/alacritty/
~/.config/i3/
~/.config/picom/
~/.config/polybar/
~/.config/rofi/
~/.config/btop/
~/.config/ranger/

/etc/lightdm/lightdm-mini-greeter/
/usr/share/fonts/ttf/
/etc/default/grub

~/.tmux/
~/.tmux.conf/

~/.gitconfig
```

### ZSH shell theme

```
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
```

### Change cursors

```

sudo ln -sf /usr/share/icons/capitaine-cursors/cursors /usr/share/icons/default/cursors

```

### Delete unused package

```

sudo pacman -Rsn $(pacman -Qdtq)
yay -Yc

```

### Browser fonts

```

/usr/share/fonts/ttf/

standard font: Times-New-Roman
serif font: Times-New-Roman
san-serif font: Arial
monospace: JetBriansMono Nerd Font

```
