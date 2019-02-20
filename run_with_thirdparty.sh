export GO111MODULE=on
BASE_DIR=$(pwd)
cd $1

BASE_HOST=$(basename $(dirname $(dirname $(pwd))))
BASE_ORG=$(basename $(dirname $(pwd)))
BASE_REPO=$(basename $(pwd))

export NODES=()
export EDGES=()

while read package
do
  node=$(echo "g.setNode('$package', {label: '$package'});")
  NODES+=( $node )
  cd $GOPATH/src/$package
  while read p
  do
    NODES+=( $(echo "g.setNode('$p', {label: '$p'});"))
    edge=$(echo "g.setEdge('$package','$p');")
    EDGES+=($edge)
  done < <(go list -f '{{join .Imports "\n"}}' | xargs go list -f '{{if not .Standard}}{{.ImportPath}}{{end}}')
done < <(go list ./...)
cd $BASE_DIR
. $BASE_DIR/mo
mo darge.html.mo
