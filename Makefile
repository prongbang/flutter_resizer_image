# Step Generate
step_1:
	cd resizer
	make build_ios
	cd ..

step_2:
	make gen

step_3:
	cd resizer
	make build_android
	cd ..

step_4:
	make step_1

gen:
	flutter_rust_bridge_codegen \
		--class-name FlutterResizerImage \
		--skip-deps-check \
		--rust-input resizer/src/api.rs \
		--dart-output lib/flutter_resizer_image.g.dart \
		--dart-decl-output lib/flutter_resizer_image.d.dart \
		-c ios/Classes/libresizer.h