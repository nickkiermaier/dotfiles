# Source this from login file like .bashrc or .profile.

# this gets the directory of currently executing script
# https://stackoverflow.com/questions/59895/how-to-get-the-source-directory-of-a-bash-script-from-within-the-script-itself
ROOT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
MUTANT_UPDATE_DOTFILES=1

if [ $MUTANT_UPDATE_DOTFILES -ne 0 ]; then
  echo "Updating dotfiles"
  cd  $ROOT_DIR
  git fetch
  git reset --hard origin/master
  cd -
fi

source "$ROOT_DIR/functions/functions-no-dependency-but-posix.sh"
source "$ROOT_DIR/functions/aws/main.sh"
source "$ROOT_DIR/functions/functions-dependencies.sh"
source "$ROOT_DIR/functions/functions-docker.sh"
source "$ROOT_DIR/functions/functions-git.sh"
source "$ROOT_DIR/functions/functions-ssh.sh"
