accessToken=`sfdx force:org:display -o mypim --verbose --json | jq -r .result.accessToken`

cd ~
mkdir -p ~/.ssh

curl -H "Authorization: Bearer $accessToken" -X GET -H "Content-Type: application/json" "https://mypim.my.salesforce.com/services/apexrest/file/id_ed25519.pub" | jq -r .content > ~/.ssh/id_ed25519.pub
chmod 400 ~/.ssh/id_ed25519.pub
curl -H "Authorization: Bearer $accessToken" -X GET -H "Content-Type: application/json" "https://mypim.my.salesforce.com/services/apexrest/file/id_ed25519" | jq -r .content > ~/.ssh/id_ed25519
chmod 400 ~/.ssh/id_ed25519

cd ~
git clone git@github.com:liumiaowilson/mypim-codebuilder.git

cd ~/mypim-codebuilder
./bootstrap.sh
