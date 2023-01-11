proto:
	rm -f lib/domain/dto/*.dart
	protoc --proto_path=proto --dart_out="grpc:lib/domain/dto" \
    proto/*.proto


.PHONY: proto