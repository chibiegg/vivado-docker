#!/bin/bash

dist=$1
dist_version=$2
package=$3
version=$4
type=$5

imagename=${package}
tagname=${version}-${dist}-${dist_version}

cd ${dist}/${dist_version}/${package}/${version}
docker build -t ${imagename}:${tagname} .

