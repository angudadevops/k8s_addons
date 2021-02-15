#!/bin/sh
 
echo "Starting bootup process..."
 
echo " "
echo "Copying config file..."
cp /curator/config/curator.yml.sample /curator/curator.yml
cp /curator/config/curator-actions.yml /curator/curator-actions.yml
 
echo " "
echo "Replacing vars..."
sed -i "s/{{ELASTIC_URL}}/$ELASTIC_URL/g" /curator/curator.yml
sed -ie "s/RETENTION_DAYS/$RETENTION_DAYS/g" /curator/curator-actions.yml
#sed -i "s/{{ELASTIC_PASSWORD}}/$ELASTIC_PASSWORD/g" /curator/curator.yml
#sed -i "s/{{ELASTIC_USER}}/$ELASTIC_USER/g" /curator/curator.yml

echo "curator.yaml"
cat /curator/curator.yml

echo " "

echo "curator-action.yaml"
cat /curator/curator-actions.yml

echo " "
echo "Calling curator..."
curator --config /curator/curator.yml $@ /curator/curator-actions.yml

