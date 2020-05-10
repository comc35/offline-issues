list=$(ls md)
TO_EXPORT=md_filtered
mkdir -p $TO_EXPORT

for i in $list ; do
echo $i
ISSUE_TITLE=$(cat md/$i | tail -n +5  | head -1)
TITLE_REPO=$(echo $ISSUE_TITLE | sed -e "s/# //" | tr '[:upper:]' '[:lower:]' | sed -e 's/ /_/g' | sed -e 's/-/_/g'| sed -e 's/://g' | sed -e "s/\r//" )
echo $TITLE_REPO
mkdir -p $TO_EXPORT/$TITLE_REPO
cat md/$i | tail -n +5 | head -n -3  | sed -e "s/\r//" | sed '/^\!\[image\](/ s/$/\n/' | sed '/^\!\[image\](/s/^/\n/'  > $TO_EXPORT/$TITLE_REPO/readme.md
done
