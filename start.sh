#! /bin/sh

echo --------------------
echo Building Docker Image
echo --------------------

wget $ZEPLO_BUNDLE_URL --header="Authorization: Bearer $ZEPLO_AUTH"

# Add the relevant Dockerfile
if [ "$ZEPLO_BUILDER_TYPE" = "docker" ]; then
	mkdir -p /workspace
	unzip bundle.zip -d /workspace -o
	rm bundle.zip
else
	mkdir -p /workspace
	unzip bundle.zip -d /workspace -o
	rm bundle.zip
	cp /builders/default/$ZEPLO_BUILDER_TYPE/Dockerfile /workspace/Dockerfile -f
fi

echo "ZEPLO:PROGRESS_DESC Building image"

if [ -n "$ZEPLO_BUILDER_PULL_EXISTING_IMAGE_CMD" ]; then
	echo "--> PULLING EXISTING CACHED IMAGES"
	sh -c "$ZEPLO_BUILDER_PULL_EXISTING_IMAGE_CMD"
fi

if [ -n "$ZEPLO_BUILDER_BUILD_CMD" ]; then
	echo "--> BUILDING IMAGES"
	sh -c "$ZEPLO_BUILDER_BUILD_CMD"
fi

echo "ZEPLO:PROGRESS_DESC Pushing image to registry"

if [ -n "$ZEPLO_BUILDER_PUSH_CMD" ]; then
	echo "--> PUSHING IMAGES"
	sh -c "$ZEPLO_BUILDER_PUSH_CMD"
fi
