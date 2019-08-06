#!/bin/bash -e

if [ -z "$SSH_PRIVATE_KEY" ]
then
    echo SSH_PRIVATE_KEY is not provided.
else
    mkdir /root/.ssh
    echo "$SSH_PRIVATE_KEY" > /root/.ssh/id_rsa
    chmod 600 /root/.ssh/id_rsa
fi

exec "$@"