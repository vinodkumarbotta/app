#!/bin/bash
set -x
url=$1
#remove a folder named lhresults if it exists
rm -rf lhresults

#create a folder named lhresults to store our lhci results
mkdir lhresults

#pull the docker image having LHCI and chrome
docker pull hemanthsridhar/lhci:1.0.0

#remove a container named lhci if exists
docker rm -f lhci

#create a docker container whose name is LHCI and shared memory size #of 512.
docker run -d --shm-size=512m -it --name lhci hemanthsridhar/lhci:1.0.0

#create lhci-config.json on the fly inside the container
docker exec -i lhci sh -c 'cat > lhci-config.json << EOF
{
  "ci": {
    "collect": {
     "numberOfRuns": 1,
     "settings": {
     "chromeFlags": "--no-sandbox --headless"
    }
  },
  "assert": {
 "preset": "lighthouse:recommended",
    "assertions": {
      "categories:performance": ["error", {"minScore": 0.75}],
      "categories:accessibility": ["error", {"minScore": 0.75}],
      "categories:best-practices": ["error", {"minScore": 0.90}],
      "categories:seo": ["error", {"minScore": 0.90}]
      }
    }
  }
}
EOF'

#Run Lighthouse CI against the container named lhci
docker exec -i lhci sh -c \
'lhci autorun --config="./lhci-config.json" --collect.url='${URL} || true

#Copy the results from the container to the host machine
docker cp lhci:/.lighthouseci ./lhresults/