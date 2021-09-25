#!/bin/bash

if [ -z "${GITHUB_REF##*heads*}" ]; then
  echo "::set-output name=branch::${GITHUB_REF#refs/heads/}"
fi

if [ -z "${GITHUB_REF##*tags*}" ]; then
  echo "::set-output name=tag::${GITHUB_REF#refs/tags/}"
fi

echo "::set-output name=date-ym::$(date +%y%m)"

if [ -z "$MAVEN_MATRIX" ]; then
  MAVEN_MATRIX='"3.8.2"'
fi

echo "::set-output name=maven-matrix::[${MAVEN_MATRIX}]"

if [ -z "$JAVA_MATRIX" ]; then
  JAVA_MATRIX='"8", "11", "17"'
fi

echo "::set-output name=java-matrix::[${JAVA_MATRIX}]"
