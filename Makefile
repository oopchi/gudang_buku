proto:
	rm -f lib/domain/dto/*.dart
	protoc --proto_path=proto --dart_out="grpc:lib/domain/dto" \
    proto/*.proto

build_runner:
	fvm flutter pub run build_runner build --delete-conflicting-outputs

.PHONY: proto build_runner