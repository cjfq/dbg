apt-get update
apt-get install -y git
mkdir -p ~/.ssh
chmod 700 ~/.ssh
ssh-keyscan -H github.com >> ~/.ssh/known_hosts
ssh -T git@github.com
git clone git@github.com:you/your-private-repo
