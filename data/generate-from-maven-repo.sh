#!/bin/bash
# Set the path to the local Maven repository
repo_path=$1

# Loop through all the directories in the repository
echo "{"
for dir in $(find $repo_path -name "*.pom"); do
  # Extract the group ID, artifact ID, and version from the directory structure
  group_id=$(dirname $(dirname $dir) | sed "s|$repo_path/||;s|/|.|g")
  trusted_version=$(basename $(dirname $dir))
  artifact_id=$(basename $(dirname $(dirname $dir)))

  group_id=${group_id%".pom"}
  group_id=${group_id%".${artifact_id}"}

  # Remove the "-redhat-XXXXX" suffix from the version
  version=$(echo -n $trusted_version | sed 's/.redhat-[0-9]\+//')
  if [ "$version" == "" ]; then
     version=$trusted_version
  fi
  
  # Build the JSON structure
  echo "\"$group_id\":{\"$artifact_id\":{\"${version}\":{\"groupId\":\"$group_id\",\"artifactId\":\"$artifact_id\",\"version\":\"$trusted_version\"}}},"
done

echo "}"
