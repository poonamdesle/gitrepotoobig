echo "HI"

uname=$(jq -r '.uname' authinfo.json | base64 -d)
pwd=$(jq -r '.pwd' authinfo.json | base64 -d)
team=trial
client_id=$(jq -r '.client_id' authinfo.json | base64 -d)
secret=$(jq -r '.secret' authinfo.json | base64 -d)

rm -rf "$team" && mkdir "$team" && cd $team
curl -L -X POST -u "$client_id:$secret" https://bitbucket.org/site/oauth2/access_token -d grant_type=password -d username=$uname -d password=$pwd > authinfo.json
jq -r '.access_token' /var/lib/jenkins/workspace/aaru/$team/authinfo.jsonauthinfo.json > /var/lib/jenkins/workspace/aaru/$team/authinfo.json/auth.txt
