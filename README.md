# Slackware Studio Builds
Configuration scripts and builds for Slackware music productions
Slackware 15.1 on the road to an eventual beta

## How
Run post_install_setup_sbo_slackpkg+_multilib.sh after installing full
Slackware 15,or Slackware current first thing you do after installation.
This will update Slackware and install sbopkg, slackpkg+ and multilib.
Overwrite all old config files when you get asked.
See config.info first then run this file to get a some essential configuration
for music production. Then create you're user and make sure you're in the audio
group and use Slackware like normal. If you're on current you might want to
set sbopkg to SBo-git (current)


## SlackBuilds
### Git Download
* adlplug
* aida-x
* airwindows
* ambix
* ams-lv2
* artyfx
* asio
* avldrums-lv2-git
* bangr
* bambootracker
* beatslash-lv2
* bespokesynth
* bchoppr
* bjumblr
* boops
* bschaffl
* bsequencer
* bshapr
* bslizr
* carla
* cliconnect
* fabla
* fasttracker2
* geonkick
* jack-stdio
* kernel
* libwebsocketpp
* lsp-plugins
* luppp
* lv2lint
* midimsg-lv2
* ninjas2
* reaper-sws
* reapack
* sherlock-lv2
* sfizz
* sorcer
* SoundScapeRenderer
* surge-xt
* swh-plugins
* xmonk-lv2
* yabridge
* wine-tkg
### Normal Download
* perl-xml-parser
* reaper
* vst2sdk
### New
* csound
* libffado
* guitarix
### Will Probably Be Dropped
* radium (broken)
* kernel-headers (I have an idea of an overlay filesystem headers swap script)
* futex-waitv-winesync-api

### Kernels
* xanmod-rt (real time recording/live monitoring)
* xanmod (composing with low latency and better support for drivers)
* zen (like xanmod but uses a recent kernel)

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
