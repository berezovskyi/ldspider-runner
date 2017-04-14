#!/usr/bin/env bash
# USAGE: ./crawl.sh URI depth (e.g. https://www.wikidata.org/wiki/Q12737077 1)
set -eu
mvn -version
(cd ../ldspider && mvn clean package -Dmaven.test.skip=true)
echo "$1" > seed.txt
java -jar ../ldspider/target/ldspider-1.3-with-dependencies.jar \
  -a ldspider.log             `# output the log to ldspider.log` \
  -any23                      `# use all the extractors any23 has` \
  -b $2                       `# strict breadth-first with n levels of depth` \
  -o "crawl-$(date +%s).nq"   `# output filename` \
  -df "frontier"              `# dump frontier after each round to frontier-xxx` \
  -t 32                       `# use 32 threads` \
  -s "seed.txt"               `# use the first argument as a seed list - must be valid RDF`
  # -ctIgnore       `# ignore bad content-type headers and parse all data` \

