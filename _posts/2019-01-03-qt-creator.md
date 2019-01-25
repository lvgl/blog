---
layout: post
title: "Running LittlevGL PC Simulator from Qt-Creator in Windows"
author: "ScarsFun"
cover: /assets/qt_creator/logo.png
image:
  path: /assets/qt_creator/logo.png
  height: 300
  width: 300

---

Qt-Creator is a powerful IDE and is easy manage non Qt project too.
With the latest release Qt 5.12.0, GCC x64 compiler, Windows is also supported.
This is a step by step tutorial 
- to run LittlevGL PC simulator
- in Windows 10
- from Qt-Creator 4.8.0
- with Mingw 64 bit compiler.

### Requirements
* Qt-Creator and Mingw-64bit environment. Refer to https://www.qt.io/ to install the open source version of Qt environment.
* SDL2 developement libraries for mingw: https://www.libsdl.org/download-2.0.php
* LittlevGL PC Simulator: https://littlevgl.com/pc-simulator

### Copy SDL2 libraries
* In *pc_simulator* folder create a subfolder named *SDL2*. 
* Copy sdl header files there.
* Create *SDL2/lib* subfolder and copy libraries for i686-w64 from SDL2 package.

### Settin up Qt-Creator project
* Open Qt-Creator
* from **file** menu select **new file or project**.
  * in the form select **non-Qt-project** and **plain C application**. Press **choose** button.

![Qt-Creator project set up](/assets/qt_creator/new_project.PNG)

* in the project management form:
  * **location**: select project directory location and type a project name (ex. : pc_sim). press **next** button.
  * **build system**: select **qmake**. press **next** button.
  * **kits**: select **Mingw 64-bit**. press **next** button.
  * **summary**: press **finish** button.

![Qt-Creator plain C app](/assets/qt_creator/plain_c_app.PNG)

A new subfolder is created with *pc_sim.pro, pc_sim.pro.user* and *main.c* template.

* close project from Qt-Creator.
* move *pc_sim.pro, pc_sim.pro.user* to main directory. remove *pc_sim* subfolder.
* from Qt-Creator: open project *pc_sim.pro*. Edit file *pc_sim.pro* and remove this two lines:
  ```
  SOURCES += \
        main.c
  ```

![Qt-Creator remove template source](/assets/qt_creator/remove_souces.PNG)
* save project
* in **projects** pane: right click on pc_sim project and select **Add Existing Directory** from menu.

![Qt-Creator add directory](/assets/qt_creator/Add_Dir.png)
  
All sources files and includes should be already selected by default.
* from file list: deselect folder *lv_examples* and *SDL2*. Then add only .c and .h files from folder *lv_examples/demo*.

![Qt-Creator remove template source](/assets/qt_creator/file_select.PNG)
* edit *pc_sim.pro* and add this lines to add SDL2 library and includes to the project:
  ```
  LIBS += -L$$PWD/SDL2/lib/ -lmingw32 -lSDL2main -lSDL2

  INCLUDEPATH += $$PWD/SDL2
  DEPENDPATH += $$PWD/SDL2
  ```

![Qt-Creator add libraries path](/assets/qt_creator/add_SDL_path.PNG)
* Save project.

### Build and Run the project

* Select **release** build from left panel icon.

![Qt-Creator manage kit](/assets/qt_creator/release.png)
* Run demo

![Qt-Creator running LittlevGL demo in PC simulator](/assets/qt_creator/QT_littlevgl.PNG)

Qt-Creator is available also for Linux and MACOS. Adapting LittlevGL PC Simulator project on these OS should be simple.
The complete project is available at this Github link: [https://github.com/ScarsFun/pc_simulator](https://github.com/ScarsFun/pc_simulator) 

