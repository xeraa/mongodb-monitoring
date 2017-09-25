#!/bin/bash

sleep 30

FILEBEAT_STATUS=$(service filebeat status)
if [[ ${FILEBEAT_STATUS} != 0 ]]
then
        service filebeat start
fi
