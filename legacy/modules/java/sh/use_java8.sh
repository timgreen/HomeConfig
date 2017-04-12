BASE_DIR="$(dirname $(readlink -f "$0"))"
JAVA8_HOME="$BASE_DIR/../action/.action_cwd/jdk1.8.0_92/"

export PATH="$JAVA8_HOME/bin:$PATH"
