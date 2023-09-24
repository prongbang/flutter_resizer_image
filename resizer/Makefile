nightly:
	rustup default nightly

stable:
	rustup default stable

before_build_android:
	rustup target add \
        aarch64-linux-android \
        armv7-linux-androideabi \
        x86_64-linux-android \
        i686-linux-android

build_android:
	export ANDROID_NDK_HOME=$HOME/Library/Android/sdk/ndk/25.2.9519653
	cargo ndk \
		-t armeabi-v7a \
		-t arm64-v8a \
		-t x86_64 \
		-t x86 \
		-o ../android/src/main/jniLibs build --release

before_build_ios:
	rustup update
	rustup target add aarch64-apple-ios x86_64-apple-ios

build_ios:
	export ANDROID_NDK_HOME=$HOME/Library/Android/sdk/ndk/25.2.9519653
	cargo lipo --release && cp target/universal/release/libresizer.a ../ios/Classes