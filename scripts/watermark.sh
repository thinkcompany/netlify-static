# Copy src/index.html to dist/index.html
cp src/index.html dist/

# Use sed to watermark dist/index.html
cd dist
echo "current branch is $BRANCH"
sed -i "s/\$COMMIT/$(echo $COMMIT_REF | cut -c1-7)/g" index.html
sed -i "s/\$TIME/$(date)/g" index.html
