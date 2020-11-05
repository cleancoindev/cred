# .env loading in the shell
dotenv () {
  echo "- Load environmental variables"
  set -a
  [ -f .env ] && . .env
  set +a
}

# Run dotenv on login
dotenv

# Run dotenv on every new directory
cd () {
  builtin cd $@
  dotenv
}

echo "- Install packages"; yarn --frozen-lockfile

echo "- Load Data into Graph"; yarn load; yarn graph || exit 1

echo "- Compute Cred"; yarn score

echo "- Distribute Grain 💸"; yarn grain > grain_output.txt

######################################################################
# ADD CODE TO CREATE PR TO ADD LATEST GRAIN DISTRIBUTION TO INSTANCE #
######################################################################
