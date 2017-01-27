#!/usr/bin/env bash
# for a list of SOLR nodes, get the schema and config files via the SOLR API for each table. Variable solr is list of keyspace.table
for solr in solr_schema_keyspace.solr_app_table core_schema_keyspace.events_table; do
   curl -u username:password http://10.1.1.1:8983/solr/resource/"$solr"/solrconfig.xml -o "$solr"-solrconfig.xml
   curl -u username:password http://10.1.1.1:8983/solr/resource/"$solr"/schema.xml -o "$solr"-schema.xml
done
