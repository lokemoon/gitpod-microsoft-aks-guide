DOMAIN="ddd.testsubject.xyz"
DOMAIN_PARTS=(${DOMAIN//./ })
f() {DOMAIN_PARTS=("${BASH_ARGV[@]}");}
shopt -s extdebug
f "${DOMAIN_PARTS[@]}"
shopt -u extdebug
let SIZE="${#DOMAIN_PARTS[@]} - 1"
DOMAIN_PARTS=("${DOMAIN_PARTS[@]:0:$SIZE}")
shopt -s extdebug
f "${DOMAIN_PARTS[@]}"
shopt -u extdebug
echo "${DOMAIN_PARTS[@]}"
BAR=${DOMAIN_PARTS[@]}     # create a space delimited string from array
PARENT_DOMAIN=${BAR// /.}   # use parameter expansion to substitute spaces with comma
echo $PARENT_DOMAIN

DNSZONES_RESOURCE_IDS=$(sudo az network dns zone list | jq -c '.[].id')
PARENT_DNSZONES_RESOURCE_ID=
for DNSZONES_RESOURCE_ID in $DNSZONES_RESOURCE_IDS; do
echo "$DNSZONES_RESOURCE_ID"
if [[ "$DNSZONES_RESOURCE_ID" == *"/testsubject.xyz"* ]]; then
  echo "It's there."
  PARENT_DNSZONES_RESOURCE_ID=$DNSZONES_RESOURCE_ID
fi
done
echo $PARENT_DNSZONES_RESOURCE_ID