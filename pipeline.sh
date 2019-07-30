# Set pipeline
fly -t node-app sp -c simple-node-js-react-npm-app/job-node.yml -p build-pipeline

# Unpause pipeline
fly -t node-app up -p build-pipeline

# Trigger pipeline jobs
fly -t node-app tj -j build-pipeline/run-pipeline -w

# List of builds
fly -t node-app builds
