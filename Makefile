all: libSDL2-iOS.a game/mac-sdl/libSDL2.a

sdl/Xcode-iOS/SDL/SDL.xcodeproj:
	git submodule update --init --depth 1 -- sdl

sdl: sdl/Xcode-iOS/SDL/SDL.xcodeproj

libSDL2-iOS.a: sdl
	DEVELOPER_DIR=/Applications/Xcode.app xcodebuild -target libSDL -project sdl/Xcode-iOS/SDL/SDL.xcodeproj
	cp sdl/Xcode-iOS/SDL/build/Release-iphoneos/libSDL2.a libSDL2-iOS.a

game/mac-sdl:
	mkdir -p game/mac-sdl

game/mac-sdl/libSDL2.a: sdl game/mac-sdl
	DEVELOPER_DIR=/Applications/Xcode.app xcodebuild -target "Static Library" -project sdl/Xcode/SDL/SDL.xcodeproj
	cp sdl/Xcode/SDL/build/Debug/libSDL2.a game/mac-sdl/libSDL2.a
