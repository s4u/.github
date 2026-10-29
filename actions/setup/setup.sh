#!/bin/bash

echo "::group::Setup preparing"

DATE_YM=$(date +%y%m)
echo "date-ym=${DATE_YM}" >> $GITHUB_OUTPUT
echo "date-ym=${DATE_YM}"

if [ -z "${GITHUB_REF##*heads*}" ]; then
  BRANCH=${GITHUB_REF#refs/heads/}
  echo "branch=${BRANCH}" >> $GITHUB_OUTPUT
  echo "branch=${BRANCH}"
fi

if [ -z "${GITHUB_REF##*tags*}" ]; then
  TAG=${GITHUB_REF#refs/tags/}
  echo "tag=${TAG}" >> $GITHUB_OUTPUT
  echo "tag=${TAG}"
fi

echo "::endgroup::"
