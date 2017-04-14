# ldspider scripts

LDSpider is a system to crawl the URLs exposing RDF recursively. This repository
presents the script to start using LDSpider on a single URI and perform
breadth-first crawl (we are interested in crawling as much data as possible, not
getting the complete info about the subject).

## Getting started

Clone this repository recursively (LDSpider is included in this repository as a
[Git Submodule](https://github.com/blog/2104-working-with-submodules)):

    git clone --recursive https://github.com/berezovskyi/ldspider-runner

Fetch https://www.wikidata.org/wiki/Q12737077 and 1 level resources it links to:

    ./bin/crawl.sh https://www.wikidata.org/wiki/Q12737077 1
    less crawl-*

Requires Maven 3.
