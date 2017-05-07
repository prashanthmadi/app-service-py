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
  echo finished pip install
fi

# run django setup commands if enabled
if [ "$DJANGO_MIGRATE" == "true" ]; then
    python manage.py migrate --noinput
fi
if [ "$DJANGO_COLLECTSTATIC" == "true" ]; then
    python manage.py collectstatic --noinput
fi
if [ "$DJANGO_COMPRESS" == "true" ]; then
    python manage.py compress
fi

# 2. Start Python Server
if [ -e "$DEPLOYMENT_TARGET/serve.py" ]; then
  cd "$DEPLOYMENT_TARGET"
  python serve.py
  exitWithMessageOnError "Python initializing file not found"
  echo app started successfully.
fi
