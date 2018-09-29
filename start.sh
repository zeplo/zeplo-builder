#! /bin/sh
echo --------------------
echo Downloading bundle
echo --------------------

wget $ZEPLO_BUNDLE_URL/$ZEPLO_DEPLOY_ID/bundle.zip \
		 --header="Authorization: Bearer $ZEPLO_AUTH"

if [ "$ZEPLO_BUILDER_TYPE" = "docker" ]; then
	mkdir -p /workspace
	unzip bundle.zip -d /workspace -o
	rm bundle.zip
else
	mkdir -p /workspace/bundle
	unzip bundle.zip -d /workspace/bundle -o
	rm bundle.zip
	cp /builders/$ZEPLO_BUILDER_TYPE/Dockerfile /workspace/Dockerfile
fi

