## Scripts

- Scripts to implement some basic computer (mainly linux) functionalities and a bit complex stuff using some some external programs.
- These are more handy when using a [tiling window manager](https://en.wikipedia.org/wiki/Tiling_window_manager).

> Most scripts are having an extension like `.sh` to avoid conflicts if a default command exists by that name (mostly unlikely). Also so that I know that this a script (mostly written by me) and not a command.
---

#### [app_name](app_name.sh)

- Functionality
    - Display current window's title.
- Dependency
    - None

#### [autostart](autostart.sh)

- Functionality
    - Put all your applications which needed to run after startup in this script. Applications like wallpaper, notification manager, clipboard manager, network manager etc.
    - Check if application is already running, if not then start it.
    - It will also select if HDMI is connected and set monitors for dual display using [monitor_config.sh](#monitor_config.sh).
    - Applications listed in _Dependencies_ are one that I use. Most of them have a check that if they are installed.

- Dependencies
    - `parcellite`: Clipboard manager.
    - `nm-applet`: Network manager.
    - `compton`: Compositing manager.
    - `dunst`: Notification manager.
    - `redshift`: For adjusting screen temperature.
    - [monitor_config](#monitor_config).
    - [new_wall](#new_wall).

#### [blur_lock](blur_lock.sh)

- Functionality
    - Fork of [i3lock-blur](https://github.com/petvas/i3lock-blur).
    - Takes screenshot of current screen, take another image to display on top of it and locks system with output image.
    - Sets screen timeout to a lower value when locked. After unlock, set to a higher value.

    ![image](img_blur_lock.png)

- Dependency
    - `xrandr`
    - `ffmpeg`
    - `i3lock`

#### [brightness_change](brightness_change.sh)

- Functionality
    - Change screen brightness.

- Dependency
    - None

#### [csb](csb)

- Functionality
    - Useful when working with big projects in C/C++.
    - Build cscope databases and tags using ctags and organise properly in `$HOME/.cstags_dir/`. For details see inside [csb](csb).

- Dependency
    - `ctags`
    - `cscope`

#### [dmenu_input](dmenu_input.sh)

- Functionality
    - Used to search web, search in dictionary or man page. For details see inside [dmenu_input.sh](dmenu_input.sh).

- Dependency
    - `firefox`
    - `dict` and `dictd`: For command line dictionary.
    - `dmenu`
    - A terminal emulator.

#### [monitor_config](monitor_config.sh)

- Functionality
    - Multiple screens setup for single, dual or duplicate screens.
    - Default is single monitor. See [autostart.sh](autostart.sh) which selects what to do.

- Dependency
    - `xrandr`

#### [dwmbar](dwmbar)

- Functionality
    - Display status bar with `xsetroot` when using dwm.

- Dependency
    - `amixer`

#### [focus_window](focus_window.sh)

- Functionality
    - Change transparency of current widow a few times to generate visual effect to show current window being used.

- Dependency
    - `compton`

#### [gadd](gadd)

- Functionality
    - Add local files to github repos.

- Dependency
    - `git`

#### [git-open](git-open)

- Functionality
    - My fork of original [git-open](https://github.com/paulirish/git-open/).
    - Used to open github links directly. 
    - Added functionality to open my github page.

- Dependency
    - `git`

#### [i3blocks](i3blocks)

- Functionality
    - [default/](i3blocks/default) stores the default scripts when `i3blocks` is installed. These are same as scripts in `/usr/share/i3blocks/`.
    - [custom/](i3blocks/custom) store scripts with little modifications of i3blocks [default](i3blocks/default) scripts. Some modifications made which are [dwmbar](#dwmbar) compatible.


- Dependency
    - None

#### [long-running](long-running.bash)

- Functionality
    - My fork of [undistract-me](https://github.com/jml/undistract-me).
    - Used to send notifications when a long command finishes.

- Dependency
    - [preexec](#preexec)
    - `notify-send`

#### [netspeed](netspeed)

- Functionality
    - Check internet speed and save results in `$HOME/`.

- Dependency
    - `speedtest-cli`

#### [new_wall](new_wall.sh)

- Functionality
    - Set a new wallpaper from files stored in given directory (and subdirectories inside).

- Dependency
    - `feh`

#### [notification_sound](notification_sound.sh)

- Functionality
    - Play notification sound.

- Dependency
    - `paplay`

#### [o](o)

- Functionality
    - Compile given c program with `gcc` and run it.

- Dependency
    - `gcc`

#### [pic_lock_exec](pic_lock_exec.sh)

- Functionality
    - Lock screen with `i3lock`. Set a random background present anywhere in the given path.
    - Sets screen timeout to a lower value when locked. After unlock, set to a higher value.

- Dependency
    - `pic_lock`: See [this](#pic_lock).

#### [pic_lock](pic_lock.sh)

- Functionality
    - Locks the screen using `i3lock` with given input image.
    - A fork of [this](https://github.com/ShikherVerma/i3lock-multimonitor).

- Dependency
    - `i3lock`
    - `xrandr`

#### [preexec](preexec.bash)

- Functionality
    - Used for [long-running](#long-running).

- Dependency
    - None


#### [run](run.sh)

- Functionality
    - Used as a test script in `PATH` for testing commands/program/functionality etc.
    - Not used by system anywhere.

- Dependency
    - Variable.

#### [samedirnoob](samedirnoob.sh)

- Functionality
    - Open new terminal in same directory as of previous terminal in a more naive way.

- Dependency
    - None

#### [samedir](samedir.sh)

- Functionality
    - Same as [samedirnoob](#samedirnoob) but do it is an advanced way.
    > Note this is not always accurate but has some other benefits.

- Dependency
    - None

#### [screenkey_toggle](screenkey_toggle.sh)

- Functionality
    - Toggle screenkeys.

- Dependency
    - `screenkey`

#### [screenshot](screenshot.sh)

- Functionality
    - Take screenshots of area, whole screen and current window.
    - Save in given `$DESTINATION` and copy to clipboard.

- Dependency
    - `scrot`
    - `xclip`

#### [startpy3](startpy3.sh)

- Functionality
    - Start python3 in `$TERMINAL`.
    - Mainly used for calculator.

- Dependency
    - `python3`

#### [suspend_lock](suspend_lock.sh)

- Functionality
    - Lock screen and suspend to RAM.
    - Sets screen timeout to a lower value when locked. After unlock, set to a higher value.

- Dependency
    - `i3lock`

#### [test](test.c)

- Functionality
    - C file used to test/verify some basics of C language. Not used by system anywhere.

- Dependency
    - None

#### [trans_dec](trans_dec.sh)

- Functionality
    -Decrease transparency of current window using `compton`.

- Dependency
    - `compton`

#### [trans_inc](trans_inc.sh)

- Functionality
    -Increase transparency of current window using `compton`.

- Dependency
    - `compton`

#### [undistract-me](undistract-me.sh)

- Functionality
    - My fork of [undistract-me](https://github.com/jml/undistract-me).
    - Used to send notifications when a long command finishes.

- Dependency
    - [long-running](#long-running)
    - [preexec](#preexec)

#### [volume_change](volume_change.sh)

- Functionality
    - Script to change system volume.
    - Also controls mic mute/unmute.

- Dependency
    - `pactl`
    - [dwmbar](#dwmbar)

#### [wifi_toggle](wifi_toggle.sh)

- Functionality
    - Toggles WiFi connection.

- Dependency
    - `nm-applet`
