1. 环境
	（1）vs2017
	（2）msys2
		pacman -S gcc
		pacman -S base-devel
		pacman -S yasm
		pacman -S nasm
		pacman -S diffutils
		pacman -S make
		//这里只列举了64为，32位x86_64替换为i386
		pacman -S mingw-w64-x86_64-toolchain
		pacman -S mingw-w64-x86_64-cmake
		pacman -S mingw-w64-x86_64-clang
		
2. 步骤
	将msys2_shell_fix.cmd放到msys2_shell.cmd所在目录。
	打开vs 2017的开发人员命令提示符
	运行将msys2_shell_fix.cmd
	下载x264源码放到与msvc_build.sh所在目录的统计目录
	修改SOURCE_DIR变量为x264源码目录
	进入msvc_build.sh所在目录，并执行sh msvc_build.sh