#!/bin/bash

check_command() {
  local cmd=$1
  local version_flag=$2
  local expected=$3

  echo "Checking $cmd..."
  if ! command -v "$cmd" &>/dev/null; then
    echo "$cmd is NOT installed or not in PATH."
    return 1
  fi

  version_output=$($cmd $version_flag 2>&1)
  if echo "$version_output" | grep -qi "$expected"; then
    echo "$cmd is installed: $version_output"
  else
    echo "$cmd is installed but version check failed: $version_output"
  fi
}

# Check Git
check_command "git" "--version" "git"

# Check Terraform
check_command "terraform" "version" "Terraform"
~
