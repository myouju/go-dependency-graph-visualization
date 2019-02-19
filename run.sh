BASE_DIR=$(pwd)
BASE_HOST=$(basename $(dirname $(dirname $(pwd))))
BASE_ORG=$(basename $(dirname $(pwd)))
BASE_REPO=$(basename $(pwd))

export NODES=()
export EDGES=()

while read package
do
  node=$(echo "g.setNode('$package', {label: '$package'});" | sed -e "s:$BASE_HOST/$BASE_ORG/$BASE_REPO/::g")
  NODES+=( $node )
  cd $GOPATH/src/$package
  while read p
  do
    edge=$(echo "g.setEdge('$package','$p');" | sed -e "s:$BASE_HOST/$BASE_ORG/$BASE_REPO/::g")
    EDGES+=($edge)
  done < <(go list -f '{{join .Imports "\n"}}' | grep $BASE_REPO)
done < <(go list ./...)
cd $BASE_DIR
. ./mo
mo darge.html.mo