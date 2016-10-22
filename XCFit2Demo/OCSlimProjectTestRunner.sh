#!/bin/bash
SLIM_PORT=$1
TEST_RUNNER_SCRIPT=/Users/Shashi/iOS/XCFit2Demo/Pods/OCSlimProject/Pod/Support/SharedSupport/../iOS/RunTestsTargetWithSlimPort
ENV_FILE_PATH=/Users/Shashi/Library/Developer/Xcode/DerivedData/XCFit2Demo-cqdjtxuopbvmutfdxiktygfnqgza/Build/Products/Debug-iphonesimulator/AcceptanceTests.app/OCSlimProject.bundle/env.sh
ERROR_LOG_FILE=OCSlimProjectTestRunner-Error.log

$TEST_RUNNER_SCRIPT $ENV_FILE_PATH $SLIM_PORT 2> >(tee $ERROR_LOG_FILE >&2)

ERROR_LOG_NO_WHITESPACE=$(more "$ERROR_LOG_FILE" | sed 's/ *$//')
	
if [ -z "$ERROR_LOG_NO_WHITESPACE" ]; then 
	rm $ERROR_LOG_FILE
	echo "[OCSP_RUN] Slim Test System Exited Normally"
else
	echo "[OCSP_RUN] Slim Test System Exited Abnormally With Reported Errors"
fi