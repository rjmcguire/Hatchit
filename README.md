# Hatchit

[![Join the chat at https://gitter.im/thirddegree/HatchitDiscussion](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/thirddegree/HatchitDiscussion)

An Open Source 3D Game Engine written in C++ focusing on support for Vulkan and DirectX 12 renderers

---

### Contributing

Any issues not related to the build system should go onto the page of the repo best suited for that issue. Graphics code goes onto the HatchitGraphics page for instance.

If you would like to submit a Pull Request it's probably best to clone this repo and follow the build instructions to get a working copy. Then fork the repo that you'd like to contribute code to and modify your .gitconfig file to point to your fork. Then you can edit, test and push all you'd like before submitting a pull request.

### Build instructions

This is subject to change and may not be complete or entirely accurate!

#### Linux

All testing and development so far has been done on Ubuntu 15.x and Fedora 23

Install the following dependencies:
* GCC (minimum required version. 5.0) -- for C++11/14 support
* CMake
* GLEW 		(For GL Support)
* SDL2
* Bullet3
* Assimp
* TinyXML2
* Python 3.5 (with pip and virtualenv)
* Vulkan SDK 	(For Vulkan Support)

Then follow these simple directions:
* Clone down the repo with `git clone --recursive http://github.com/thirddegree/Hatchit`
* `cd` into the Linux directory
* Run the `configure.sh` script
* `cd` into `_build/` and then either `debug/` or `release/`
* Run `make -j 16`
* Run your new `ht_test` executable!

#### Windows

This is a bit more of a pain. All dependencies are submodules in the Third Party
directory and will need to be built before you build Hatchit.

All testing and development has been done on Windows 10 with Visual Studio 2015

##### Pre-Build
We recommend using some sort of cmd replacement in Windows such as cmder or some sort of bash shell
* Install CMake and make sure it is in your path
* Make sure that you can run `msbuild.exe` from your shell. If it's not there try running the `vcvarsall.bat` file located at `C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\vcvarsall.bat` for Visual Studio 2015
* Clone down the repo with `git clone --recursive http://github.com/thirddegree/Hatchit`

To build with Vulkan support you MUST have installed:
* Vulkan SDK
* Vulkan supported drivers!

To build with Direct X 12 support you MUST install:
* Windows 10 SDK

The build system requires that you have a working Python 3.5 installation.

##### Third Party
Next up is building all the dependencies. This should only have to be done once for your machine. After this you won't have to worry about `vcvarsall.bat` but you will need CMake.

* `cd` into `Hatchit\Windows\ThirdParty`
* Run the `config.bat` file located here. This should configure AND BUILD all your dependencies

##### Hatchit
This is the easy part!

* `cd` into `Hatchit\Windows`
* Run the `config.bat` files located here. This will configure the Visual Studio solution
* `config.bat` takes command line arguments! Add `GL` to build with OpenGL 4.2+ support. Add `DX` to build with Direct X 11 support. Add `VK` to build with Vulkan support. Add `DX12` to build with Direct X 12 support. For example to build with Vulkan and Direct X 12 support you would run `config.bat VK DX12`.
* Your shell should be located in `Hatchit\Windows\_build\VS2015`
* Open the `HatchitEngine.sln` file however you'd like
* Make sure that `HatchitTest` is marked as your startup project
* Build and Run!
