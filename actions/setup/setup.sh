#!/bin/bash

echo "::group::Setup preparing"

DATE_YM=$(date +%y%m)
echo "::set-output name=date-ym::${DATE_YM}"
echo "date-ym=${DATE_YM}"

if [ -z "${GITHUB_REF##*heads*}" ]; then
  BRANCH=${GITHUB_REF#refs/heads/}
  echo "::set-output name=branch::${BRANCH}"
  echo "branch=${BRANCH}"
fi

if [ -z "${GITHUB_REF##*tags*}" ]; then
  TAG=${GITHUB_REF#refs/tags/}
  echo "::set-output name=tag::${TAG}"
  echo "tag=${TAG}"
fi

MAVEN_DEFAULT='3.8.1'
echo "::set-output name=maven-default::${MAVEN_DEFAULT}"
echo "maven-default=${MAVEN_DEFAULT}"

if [ -z "$MAVEN_MATRIX" ]; then
  MAVEN_MATRIX='"3.8.2"'
fi

echo "::set-output name=maven-matrix::[${MAVEN_MATRIX}]"
echo "maven-matrix=[${MAVEN_MATRIX}]"

JAVA_DEFAULT='8'
echo "::set-output name=java-default::${JAVA_DEFAULT}"
echo "java-default=${JAVA_DEFAULT}"

if [ -z "$JAVA_MATRIX" ]; then
  JAVA_MATRIX='"8", "11", "17"'
fi

echo "::set-output name=java-matrix::[${JAVA_MATRIX}]"
echo "java-matrix=[${JAVA_MATRIX}]"

echo "::endgroup::"
