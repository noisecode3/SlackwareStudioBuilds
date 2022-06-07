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

Tips: Build a better kernel

Tips: You could install jack2 like this after:

slackpkg install pulseaudio-jack jack2 zita-resampler zita-alsa-pcmi portaudio qjackctl

pulseaudio/jack don't just work with startxfce4 enabling jack D-bus
it will just work with init 4 in /etc/inittab

Tips: You can look at post_install.sh for configuration inspiration to start with if you don't want to run it
