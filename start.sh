#!/bin/bash
source /mnt/e/config.vars

hostname ${SETUP_HOSTNAME}

${SETUP_HOME}/setup/setup-dns.sh

# Run setup stuff...
if [ -e /root/.start ]; then exit 255 ; fi

echo "Running setup scripts from ${SETUP_HOME}..."

for SETUP_SCRIPT in ${SETUP_SCRIPTS}; do
  SETUP_SCRIPT_NAME="setup-${SETUP_SCRIPT}.sh"
  echo "  Running ${SETUP_SCRIPT}. . ."
  ${SETUP_HOME}/setup/${SETUP_SCRIPT_NAME} > /tmp/${SETUP_SCRIPT}.out 2>&1
  echo "Return code = $?; Output in /tmp/${SETUP_SCRIPT}.out"; echo
done

touch /root/.start
