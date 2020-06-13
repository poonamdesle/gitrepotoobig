#!/bin/bash

uname=$(jq -r '.uname' authinfo.json | base64 -d)
pwd=$(jq -r '.pwd' authinfo.json | base64 -d)
client_id=$(jq -r '.client_id' authinfo.json | base64 -d)
secret=$(jq -r '.secret' authinfo.json | base64 -d)
team=trial

rm -rf "$team" && mkdir "$team" && cd $team
curl -L -X POST -u "$client_id:$secret" https://bitbucket.org/site/oauth2/access_token -d grant_type=password -d username=$uname -d password=$pwd > authinfo.json
jq -r '.access_token' authinfo.json > auth.txt

NEXT_URL="https://api.bitbucket.org/2.0/repositories/$team/$USERNAME?access_token=$access-token"

    curl -L -X POST -u "$client_id:$secret" $URL > authinfo.json
	jq -r '.access_token' authinfo.json > auth.txt
	for i in $(cat auth.txt);
	do
         access-token=$(echo $i | awk -F '{ print $1}' )
		 
	done	 
    
	curl -u $USERNAME:$PWD $NEXT_URL > repoinfo.json
    jq -r '.values[] | .name' repoinfo.json > repos.txt
    
    for i in $(cat repos.txt);
    do
        
		reponame=$(echo $i | awk -F '{ print $1}' )
		repourl= git@bitbucket.org:$uname/$reponame.git
		git clone $repourl
        echo "$(du -shc $repo_name/*)"
        echo "$(du -shc $repo_name/*)" | awk 'NR==2{print $1}'
        size=$(echo "$(du -shc $repo_name/*)" | awk 'NR==2{print $1}')
        echo "Total size  of repository is $size"
        if [ $size > $threshold ]
        then 
            echo " Requided to cleanup of repository"
        fi
		
    done
	
