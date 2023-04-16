
gen_header:
	cargo test --features c-headers -- generate_headers
	cp -a ./header/resizer_image.h ../ios/Classes

gen_a:
	cargo lipo --release
	cp ./target/universal/release/libresizer_image.a ../ios/
	cp ./target/universal/release/libresizer_image.a ./lipo/

gen_so:
	# Android Plugin for Gradle 3.1.0 and higher no longer generate APKs for the following ABIs by default: mips, mips64, and armeabi.
	cargo ndk -t armeabi-v7a -t arm64-v8a -t x86 -t x86_64 -t arm64-v8a -o ./jniLibs build --release
	cp -a ./jniLibs ../android/src/main


# --------------------------------- flutter_rust_bridge (Error!) ---------------------------------
# Requirement
# cargo install cbindgen
# dart pub global activate ffigen
# cargo install flutter_rust_bridge_codegen
gen_rust_dart_header:
	flutter_rust_bridge_codegen --rust-input src/lib.rs --rust-output src/resizer_image.rs --dart-output dart/resizer_image.dart --c-output header/resizer_image.h