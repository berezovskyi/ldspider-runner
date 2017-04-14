#!/usr/bin/env bash
# USAGE: ./crawl.sh URI depth (e.g. https://www.wikidata.org/wiki/Q12737077 1)
set -eu
if [ ! -f "../ldspider/target/ldspider-1.3-with-dependencies.jar" ]; then
  sh build.sh
fi
echo "$1" > seed.txt
domain=$(python -c "from urlparse import urlparse
url = urlparse('$1')
print url.netloc")
echo "Limiting the crawl to the domain $domain"
java -jar ../ldspider/target/ldspider-1.3-with-dependencies.jar \
  -a ldspider.log             `# output the log to ldspider.log` \
  -any23                      `# use all the extractors any23 has` \
  -b $2                      `# strict breadth-first with n levels of depth` \
  -o "crawl-$(date +%s).nq"   `# output filename` \
  -df "frontier"              `# dump frontier after each round to frontier-xxx` \
  -t 64                       `# use 64 threads` \
  -s "seed.txt"               `# use the first argument as a seed list - must be valid RDF` \
  -e                          `# omit header triple in data` \
  -y "$domain"                `# stay on the hostname in the third argument`
  # -ctIgnore       `# ignore bad content-type headers and parse all data` \

