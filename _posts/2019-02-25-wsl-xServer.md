---
layout: post
title: "Run Linux On Win10 For PC Simulator With WSL+XLaunch"
author: "beibean"
cover: /assets/wsl_xlaunch/cover.png
image:
  path: /assets/wsl_xlaunch/cover.png
  height: 300
  width: 300
---

# What is this post about?
This post rises to explain a new method to run PC Simulator within Windows 10. So far, there are many ways of launching simulation:

* [PC-Simulator](https://docs.littlevgl.com/#PC-simulator)
* [QT-Creator](https://blog.littlevgl.com/2019-01-03/qt-creator)
* [Codeblocks](https://github.com/littlevgl/pc_simulator_win_codeblocks)

Nevertheless, I have seen some people and myself having some troubles when executing simulation on Windows 10. That's way I post the simplest and working method for me.

# Which programs do we need to install?

* [Windows Subsystem for Linux](https://docs.microsoft.com/en-us/windows/wsl/install-win10): allows Linux programs to run natively on Windows.
* [VcXsrv](https://sourceforge.net/projects/vcxsrv): allows unix system to use xServer as their standard GUI environment.

# Which dependencies de we need to install?

* [SDL2](https://docs.littlevgl.com/#PC-simulator): install dependencies from WSL terminar as it is explained for Linux.
* Dependencies indicated within [Dockerfile](https://github.com/littlevgl/pc_simulator_sdl_eclipse/blob/master/Dockerfile).
* If you want to use a full ubuntu desktop, you can install [xfce desktop](https://github.com/QMonkey/wsl-tutorial) to run Eclipse on Linux Environment from Windows (WSL). On this post it is not explained more about this but it is easy to follow link instructions.

# Once everything is installed, what comes next?

* Build project from WSL using:

```bash
$> make
```

 Wait until it finishes building.

* Open XLaunch, choose *One large window* and set the *display number* to -1. Leave other settings as default and finish the configuration.

* Launch from WSL 

```bash
$> ./demo
```


![Enjoy the library](/assets/wsl_xlaunch/pc_sim_running.png)
