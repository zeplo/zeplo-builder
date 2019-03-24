#! /bin/sh

try_step_interval=${ZEPLO_BUILDER_TRY_STEP_INTERVAL-"1"}
max_tries=${ZEPLO_BUILDER_MAX_TRIES-"3"}
retry() {
  local tries=0
  until $@ ; do
    status=$?
    tries=$(($tries + 1))
    if [ $tries -gt $max_tries ] ; then
      echoerr "Failed to run \`$@\` after $max_tries tries..."
      return $status
    fi
    sleepsec=$(($tries * $try_step_interval))
    echoerr "Failed: \`$@\`, retyring in $sleepsec seconds..."
    sleep $sleepsec
  done
  return $?
}


echo --------------------
echo Building Docker Image
echo --------------------

echo "--> DOWNLOADING CLIENT CODE"

retry wget $ZEPLO_BUNDLE_URL --header="Authorization: Bearer $ZEPLO_AUTH"

# Add the relevant Dockerfile
if [ "$ZEPLO_BUILDER_TYPE" = "docker" ]; then
	mkdir -p /workspace
	unzip bundle.zip -d /workspace -o
	rm bundle.zip
else
	mkdir -p /workspace
	unzip bundle.zip -d /workspace -o
	rm bundle.zip
	cp /builders/$ZEPLO_BUILDER_TYPE/Dockerfile /workspace/Dockerfile -f
fi

if [ -z "$ZEPLO_BUILDER_PULL_EXISTING_IMAGE_CMD" ]; then
	echo "--> PULLING EXISTING CACHED IMAGES"
	retry $ZEPLO_BUILDER_PULL_EXISTING_IMAGE_CMD
fi

if [ -z "$ZEPLO_BUILDER_BUILD_CMD" ]; then
	echo "--> BUILDING IMAGES"
	retry $ZEPLO_BUILDER_BUILD_CMD
fi

if [ -z "$ZEPLO_BUILDER_PUSH_CMD" ]; then
	echo "--> PUSHING IMAGES"
	retry $ZEPLO_BUILDER_PUSH_CMD
fi
