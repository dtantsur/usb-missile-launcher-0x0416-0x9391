=======================================================
missile_launcher-1.0 idVendor: 0x0416 idProduct: 0x9391
=======================================================

Linux kernel module missile_launcher-1.0
Copyright (C) 2012  Dirk Stanke <dirk@stanke.eu>, Dennis Labriola <l@briola.net>
Copyright (C) 2019  Dmitry Tantsir <dtantsur@protonmail.com>

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.


Introduction
=============

This is a linux kernel module for the usb missile launcher idVendor: 0x0416
idProduct: 0x9391. It makes use of the ``/sys/`` pseudo-filesystem for user
interaction. So you could easily write an user program in many programming
languages to control the device. Note that ``root`` access is currently
required.

Installing missile_launcher on GNU/Linux Systems
================================================

#. Install Linux kernel sources, e.g. ``kernel-devel`` package on Fedora.
   On Ubuntu/Mint try something like::

    sudo apt-get install linux-headers-*-*

   (replacing the "*" with your right version gathered via ``uname -r``).

#. Lookup the path where your kernel source files have been installed.
   Can be something like ``/usr/src/linux-headers-<your version>`` or
   ``/usr/src/kernels/<your version>``.

#. From the missile_launcher source directory run::

    make KDIR=/your/path/to/headers/

   now you should now have a ``missile_launcher.ko`` file in your directory!

#. Get hot-plugging support working! Edit the 10-usb.rules file, you need
   to replace the ``/your/path/to/missile_launcher.ko`` path with the real path
   to the .ko file.

   Then run::

     sudo cp missile_launcher.ko /etc/udev/rules.d/

   Plug-in your device and check via:: 

    lsmod | grep missile_launcher

   if it has been loaded.

#. Or load it manually via::

     sudo insmod missile_launcher.ko.

#. Try using mc.sh (./mc.sh) to check that everything works properly.
