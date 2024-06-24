# Slackware Studio Builds
Configuration scripts and builds for Slackware music productions
Slackware 15.1 on the road to an eventual beta

## SlackBuilds
### Git Download
* SoundScapeRenderer
* ams-lv2
* bangr
* boops
* carla
* jack-stdio
* luppp
* surge-xt
* yabridge
* adlplug
* artyfx
* bchoppr
* bschaffl
* cliconnect
* kernel
* lv2lint
* swh-plugins
* aida-x
* asio
* beatslash-lv2
* bsequencer
* fabla
* midimsg-lv2
* sfizz
* vst2sdk
* airwindows
* avldrums-lv2-git
* bespokesynth
* bshapr
* libwebsocketpp
* ninjas2
* sherlock-lv2
* wine-tkg
* ambix
* bambootracker
* bjumblr
* bslizr
* geonkick
* lsp-plugins
* perl-xml-parser
* sorcer
* xmonk-lv2
### Normal Download
### New
* reaper
* reaper-sws
* reapack
### Will Probably Be Dropped
* radium (broken)
* kernel-headers (I have an idea of an overlay filesystem headers swap script)
* futex-waitv-winesync-api

### Kernels
* xanmod-rt (real time recording/live monitoring)
* xanmod (composing with low latency and better support for drivers)
* zen (like xanmod but uses a recent kernel)

## How
Run post_install_setup_sbo_slackpkg+_multilib.sh after installing full
Slackware 15,or Slackware current first thing you do after installation.
This will update Slackware and install sbopkg, slackpkg+ and multilib.
Overwrite all old config files when you get asked.
See config.info first then run this file to get a some essential configuration
for music production. Then create you're user and make sure you're in the audio
group and use Slackware like normal.

## 
* Tips
  * build a better kernel
  * look at pipewire-enable.sh and pipewire-disable.sh /usr/sbin/
* Slackbuilds pkg tips
  * [jack](https://slackbuilds.org/repository/15.0/audio/jack/)
  * [pipewire-native-jack](https://slackbuilds.org/repository/15.0/audio/pipewire-native-jack/)
  * [carla](https://slackbuilds.org/repository/15.0/audio/carla/)
* Alien pkg tips
  * [pipewire-jack](http://www.slackware.com/~alien/slackbuilds/pipewire-jack/)
  * [pulseaudio-jack](http://www.slackware.com/~alien/slackbuilds/pulseaudio-jack/pkg64/)
