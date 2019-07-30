---
platform: linux

image_resource:
  type: docker-image
  source: {repository: node}

inputs:
- name: node-app

run:
  path: sh
  args:
  - -c
  - |
    cd node-app
    ./jenkins/scripts/deliver.sh
    echo 'Finished using the web site? (Click "Proceed" to continue)'
    ./jenkins/scripts/kill.sh
