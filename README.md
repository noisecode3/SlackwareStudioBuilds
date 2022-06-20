# Slackware Studio Builds
Configuration scripts and builds for Slackware music productions

# Kernels
I am focusing on kernel 5.17 with PREEMPT_RT almost done, testing

I planing on configuring those kernels and making the scripts:

 - kernel 5.15 XanMod also with PREEMPT_RT
 - kernel 5.17 tkg with normal PREEMPT

# How
Run post_install.sh after installing full Slackware 15 first thing you do after installation.
Overwrite all old config files.
Then create you're user and make sure you're in the audio group and use Slackware like normal.

 - Tips: Build a better kernel

 - Tips: look at pipewire-enable.sh and pipewire-disable.sh /usr/sbin/

 - Slackbuilds tips: [jack](https://slackbuilds.org/repository/15.0/audio/jack/)<br/>
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;
[alsa-plugin-jack](https://slackbuilds.org/repository/15.0/audio/alsa-plugin-jack/)<br/>
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;
[pipewire-native-jack](https://slackbuilds.org/repository/15.0/audio/pipewire-native-jack/)<br/>
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&nbsp;
[carla](https://slackbuilds.org/repository/15.0/audio/carla/)

 - alien tips: [pipewire-jack](http://www.slackware.com/~alien/slackbuilds/pipewire-jack/)

 - Tips: You can look at post_install.sh for configuration inspiration to start with if you don't want to run it
