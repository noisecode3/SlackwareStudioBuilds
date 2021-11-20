#!/bin/bash
# Slackware wine-tkg /opt pkg helper
# Copyright (C) 2022  Martin Bångens

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

function restore
{
  echo "Restoring... (remove symlinks restore from backup files)"
  cd /usr/bin/

  rm -v function_grep.pl msidb msiexec notepad regedit regsvr32 widl wine wine-preloader wine-tkg \
  wine-tkg-interactive wine64 wine64-preloader wine64-tkg wineboot winebuild winecfg wineconsole   \
  winecpp winedbg winedump winefile wineg++ winegcc winemaker winemine winepath wineserver wmc wrc  \
  2>/dev/null

  echo "Moving back files"

  mv -fv function_grep.pl.wine-backup     function_grep.pl      2>/dev/null
  mv -fv msidb.wine-backup                msidb                 2>/dev/null
  mv -fv msiexec.wine-backup              msiexec               2>/dev/null
  mv -fv notepad.wine-backup              notepad               2>/dev/null
  mv -fv regedit.wine-backup              regedit               2>/dev/null
  mv -fv regsvr32.wine-backup             regsvr32              2>/dev/null
  mv -fv widl.wine-backup                 widl                  2>/dev/null
  mv -fv wine.wine-backup                 wine                  2>/dev/null
  mv -fv wine-preloader.wine-backup       wine-preloader        2>/dev/null
  mv -fv wine-tkg.wine-backup             wine-tkg              2>/dev/null
  mv -fv wine-tkg-interactive.wine-backup wine-tkg-interactive  2>/dev/null
  mv -fv wine64.wine-backup               wine64                2>/dev/null
  mv -fv wine64-preloader.wine-backup     wine64-preloader      2>/dev/null
  mv -fv wine64-tkg.wine-backup           wine64-tkg            2>/dev/null
  mv -fv wineboot.wine-backup             wineboot              2>/dev/null
  mv -fv winebuild.wine-backup            winebuild             2>/dev/null
  mv -fv winecfg.wine-backup              winecfg               2>/dev/null
  mv -fv wineconsole.wine-backup          wineconsole           2>/dev/null
  mv -fv winecpp.wine-backup              winecpp               2>/dev/null
  mv -fv winedbg.wine-backup              winedbg               2>/dev/null
  mv -fv winedump.wine-backup             winedump              2>/dev/null
  mv -fv winefile.wine-backup             winefile              2>/dev/null
  mv -fv wineg++.wine-backup              wineg++               2>/dev/null
  mv -fv winegcc.wine-backup              winegcc               2>/dev/null
  mv -fv winemaker.wine-backup            winemaker             2>/dev/null
  mv -fv winemine.wine-backup             winemine              2>/dev/null
  mv -fv winepath.wine-backup             winepath              2>/dev/null
  mv -fv wineserver.wine-backup           wineserver            2>/dev/null
  mv -fv wmc.wine-backup                  wmc                   2>/dev/null
  mv -fv wrc.wine-backup                  wrc                   2>/dev/null
}

function backup
{
  echo "Making a backup..."
  cd /usr/bin/
  if [[ -f "/usr/bin/*.wine-backup" ]]; then
    echo "Only one binary backup in /usr/bin allowed."
    echo "Use --force-no-backup to skip this (dirty)."
    echo "If you use --restore first then --force-no-backup"
    echo "you can delete the backup by installing new symlinks."
    echo "--force-no-backup and --restore can brake you're wine"
    echo "installation in /usr/bin forcing you to reinstall wine"
    exit 1
  fi

  mv -fv function_grep.pl      function_grep.pl.wine-backup     2>/dev/null
  mv -fv msidb                 msidb.wine-backup                2>/dev/null
  mv -fv msiexec               msiexec.wine-backup              2>/dev/null
  mv -fv notepad               notepad.wine-backup              2>/dev/null
  mv -fv regedit               regedit.wine-backup              2>/dev/null
  mv -fv regsvr32              regsvr32.wine-backup             2>/dev/null
  mv -fv widl                  widl.wine-backup                 2>/dev/null
  mv -fv wine                  wine.wine-backup                 2>/dev/null
  mv -fv wine-preloader        wine-preloader.wine-backup       2>/dev/null
  mv -fv wine-tkg              wine-tkg.wine-backup             2>/dev/null
  mv -fv wine-tkg-interactive  wine-tkg-interactive.wine-backup 2>/dev/null
  mv -fv wine64                wine64.wine-backup               2>/dev/null
  mv -fv wine64-preloader      wine64-preloader.wine-backup     2>/dev/null
  mv -fv wine64-tkg            wine64-tkg.wine-backup           2>/dev/null
  mv -fv wineboot              wineboot.wine-backup             2>/dev/null
  mv -fv winebuild             winebuild.wine-backup            2>/dev/null
  mv -fv winecfg               winecfg.wine-backup              2>/dev/null
  mv -fv wineconsole           wineconsole.wine-backup          2>/dev/null
  mv -fv winecpp               winecpp.wine-backup              2>/dev/null
  mv -fv winedbg               winedbg.wine-backup              2>/dev/null
  mv -fv winedump              winedump.wine-backup             2>/dev/null
  mv -fv winefile              winefile.wine-backup             2>/dev/null
  mv -fv wineg++               wineg++.wine-backup              2>/dev/null
  mv -fv winegcc               winegcc.wine-backup              2>/dev/null
  mv -fv winemaker             winemaker.wine-backup            2>/dev/null
  mv -fv winemine              winemine.wine-backup             2>/dev/null
  mv -fv winepath              winepath.wine-backup             2>/dev/null
  mv -fv wineserver            wineserver.wine-backup           2>/dev/null
  mv -fv wmc                   wmc.wine-backup                  2>/dev/null
  mv -fv wrc                   wrc.wine-backup                  2>/dev/null
}

function link
{
  echo "Creating Symbolic links..."
  cd /usr/bin/
  ln -fsv /opt/wine-tkg-staging-fsync-git-7.6.r0.g539ecd2f/bin/function_grep.pl     /usr/bin/
  ln -fsv /opt/wine-tkg-staging-fsync-git-7.6.r0.g539ecd2f/bin/msidb                /usr/bin/
  ln -fsv /opt/wine-tkg-staging-fsync-git-7.6.r0.g539ecd2f/bin/msiexec              /usr/bin/
  ln -fsv /opt/wine-tkg-staging-fsync-git-7.6.r0.g539ecd2f/bin/notepad              /usr/bin/
  ln -fsv /opt/wine-tkg-staging-fsync-git-7.6.r0.g539ecd2f/bin/regedit              /usr/bin/
  ln -fsv /opt/wine-tkg-staging-fsync-git-7.6.r0.g539ecd2f/bin/regsvr32             /usr/bin/
  ln -fsv /opt/wine-tkg-staging-fsync-git-7.6.r0.g539ecd2f/bin/widl                 /usr/bin/
  ln -fsv /opt/wine-tkg-staging-fsync-git-7.6.r0.g539ecd2f/bin/wine                 /usr/bin/
  ln -fsv /opt/wine-tkg-staging-fsync-git-7.6.r0.g539ecd2f/bin/wine-preloader       /usr/bin/
  ln -fsv /opt/wine-tkg-staging-fsync-git-7.6.r0.g539ecd2f/bin/wine-tkg             /usr/bin/
  ln -fsv /opt/wine-tkg-staging-fsync-git-7.6.r0.g539ecd2f/bin/wine-tkg-interactive /usr/bin/
  ln -fsv /opt/wine-tkg-staging-fsync-git-7.6.r0.g539ecd2f/bin/wine64               /usr/bin/
  ln -fsv /opt/wine-tkg-staging-fsync-git-7.6.r0.g539ecd2f/bin/wine64-preloader     /usr/bin/
  ln -fsv /opt/wine-tkg-staging-fsync-git-7.6.r0.g539ecd2f/bin/wine64-tkg           /usr/bin/
  ln -fsv /opt/wine-tkg-staging-fsync-git-7.6.r0.g539ecd2f/bin/wineboot             /usr/bin/
  ln -fsv /opt/wine-tkg-staging-fsync-git-7.6.r0.g539ecd2f/bin/winebuild            /usr/bin/
  ln -fsv /opt/wine-tkg-staging-fsync-git-7.6.r0.g539ecd2f/bin/winecfg              /usr/bin/
  ln -fsv /opt/wine-tkg-staging-fsync-git-7.6.r0.g539ecd2f/bin/wineconsole          /usr/bin/
  ln -fsv /opt/wine-tkg-staging-fsync-git-7.6.r0.g539ecd2f/bin/winecpp              /usr/bin/
  ln -fsv /opt/wine-tkg-staging-fsync-git-7.6.r0.g539ecd2f/bin/winedbg              /usr/bin/
  ln -fsv /opt/wine-tkg-staging-fsync-git-7.6.r0.g539ecd2f/bin/winedump             /usr/bin/
  ln -fsv /opt/wine-tkg-staging-fsync-git-7.6.r0.g539ecd2f/bin/winefile             /usr/bin/
  ln -fsv /opt/wine-tkg-staging-fsync-git-7.6.r0.g539ecd2f/bin/wineg++              /usr/bin/
  ln -fsv /opt/wine-tkg-staging-fsync-git-7.6.r0.g539ecd2f/bin/winegcc              /usr/bin/
  ln -fsv /opt/wine-tkg-staging-fsync-git-7.6.r0.g539ecd2f/bin/winemaker            /usr/bin/
  ln -fsv /opt/wine-tkg-staging-fsync-git-7.6.r0.g539ecd2f/bin/winemine             /usr/bin/
  ln -fsv /opt/wine-tkg-staging-fsync-git-7.6.r0.g539ecd2f/bin/winepath             /usr/bin/
  ln -fsv /opt/wine-tkg-staging-fsync-git-7.6.r0.g539ecd2f/bin/wineserver           /usr/bin/
  ln -fsv /opt/wine-tkg-staging-fsync-git-7.6.r0.g539ecd2f/bin/wmc                  /usr/bin/
  ln -fsv /opt/wine-tkg-staging-fsync-git-7.6.r0.g539ecd2f/bin/wrc                  /usr/bin/
}

if [[ "$1" == '--restore' ]]; then
  restore
  exit 0
fi

if [[ "$1" == '--force-no-backup' ]]; then
  link
  exit 0
fi

# Remember:! -L = (NOT symbolic link)
# if you got a weird or broken installation with a mix of symlinks (exept for wineg++ and winecpp, that's normal)
# among these files. It will still back that up if one of the selected ones are NOT symlinks or is missing
# this means that is not probably directly from this script.

if [[ ! -L /usr/bin/function_grep.pl && /usr/bin/msidb && /usr/bin/msiexec && /usr/bin/notepad \
&& /usr/bin/regedit && /usr/bin/regsvr32 && /usr/bin/widl && /usr/bin/wine && /usr/bin/wine-preloader \
&& /usr/bin/wine-tkg && /usr/bin/wine-tkg-interactive && /usr/bin/wine64  && /usr/bin/wine64-preloader \
&& /usr/bin/wine64-tkg && /usr/bin/wineboot && /usr/bin/winebuild && /usr/bin/winecfg && /usr/bin/wineconsole \
&& /usr/bin/winedbg && /usr/bin/winedump && /usr/bin/winefile && /usr/bin/winegcc && /usr/bin/winemaker \
&& /usr/bin/winemine   && /usr/bin/winepath && /usr/bin/wineserver && /usr/bin/wmc && /usr/bin/wrc ]]; then

  echo "If there is wine binaries in /usr/bin we back them up"
  backup
  link
  exit 0
fi

# all was symlinks, safe to overwrite
link
exit 0
