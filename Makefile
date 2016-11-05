all: libSDL2-iOS.a

sdl:
	git submodule update --depth 1 -- sdl

libSDL2-iOS.a: sdl
	DEVELOPER_DIR=/Applications/Xcode.app xcodebuild -target libSDL -project sdl/Xcode-iOS/SDL/SDL.xcodeproj
	cp sdl/Xcode-iOS/SDL/build/Release-iphoneos/libSDL2.a libSDL2-iOS.a
