# Set pipeline
fly -t node-app sp -c simple-node-js-react-npm-app/job-node.yml -p build-test-deploy

# Unpause pipeline
fly -t node-app up -p build-test-deploy

# Trigger pipeline jobs

fly -t node-app tj -j build-test-deploy/run-tests -w

# List of builds
fly -t node-app builds
