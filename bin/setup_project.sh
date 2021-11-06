#! /bin/bash
set -eu -o pipefail

cd $(dirname $0)/..

usage() {
      cat <<EOF
Rename references of python_skeleton to your project name, and change author references to yourself.

Usage: setup_project.sh <github username> <project name>
EOF
exit 1
}

if [[ $# != 2 ]]; then
  usage
fi

GIT_USERNAME=$1
PROJECT_NAME=$2

files_to_change=(
  ci/pylint.sh
  pytest.ini
  setup.cfg
  setup.py
  tox.ini
  README.md
)


echo "Changing references of 'ruby_skeleton' and 'fdm1' to '$PROJECT_NAME' and '$GIT_USERNAME'"
# Change references in files
for file in ${files_to_change[@]}; do
   perl -i -pe "s/ruby_skeleton/$PROJECT_NAME/g" $file
   perl -i -pe "s/fdm1/$GIT_USERNAME/g" $file
done

# Rename main library directory
mv ruby_skeleton $PROJECT_NAME


echo "Clearing out the README"
# Probably more elegant way to do this.
perl -i -pe "s/Ruby Skeleton/$PROJECT_NAME/g" README.md
cp README.md README.md.bak
head -3 README.md.bak > README.md
tail -1 README.md | perl -pe "s/./=/g" >> README.md
rm README.md.bak


NEW_REMOTE_ORIGIN=git@github.com:$GIT_USERNAME/$PROJECT_NAME.git
echo "Updating Github remote origin to $NEW_REMOTE_ORIGIN"
# git remote remove origin
# git remote add origin $NEW_REMOTE_ORIGIN


echo "Removing this 'setup_project' script"
rm -rf bin

echo "This is now the project '$PROJECT_NAME', owned by $GIT_USERNAME."
