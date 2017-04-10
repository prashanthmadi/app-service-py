#!/bin/bash

echo Deployment Target $DEPLOYMENT_TARGET

exitWithMessageOnError () {
  if [ ! $? -eq 0 ]; then
    echo "An error has occurred during web site deployment."
    echo $1
    exit 1
  fi
}

# 1. Run Pip Install
if [ -e "$DEPLOYMENT_TARGET/requirements.txt" ]; then
  cd "$DEPLOYMENT_TARGET"
  pip install -r requirements.txt
  exitWithMessageOnError "pip install failed"
fi
echo finished pip install

# 2. Start Python Server
if [ -e "$DEPLOYMENT_TARGET/serve.py" ]; then
  cd "$DEPLOYMENT_TARGET"
  python serve.py
  exitWithMessageOnError "Python initializing file not found"
fi
echo app started successfully.
