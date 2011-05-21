#!/bin/bash
if [[ $1 == "" || ! -d $1 ]]
then
  if [[ $1 != "" ]]
  then
    echo "Directory $1 does not exists !!!"
  fi
  echo "Usage: sh $0 /path/to/your/photos [target_dir]"
  exit
fi

if [[ `which convert` == "" ]]
then
  echo "There is no convert program, you may need to install the ImageMagick software."
  exit
fi

cdir=`pwd`

sourceDir=$1
if [[ $2 != "" ]]
then
  targetDir=$2
else
  targetDir=$cdir/`date +'%Y-%m-%d_%H_%M'`
fi
[ ! -d $targetDir ] && mkdir -p $targetDir/{thumbnails,pictures}

images=`ls $sourceDir/*`
total=`echo $images | wc -w`
index=1
for f in $images; do 
  echo "Process: $f ... ($index/$total)";
  filename=`basename $f | tr A-Z a-z`
  picture=$targetDir/pictures/$filename
  convert -resize 1024x768 $f $picture 
  convert -resize 300x250 $picture $targetDir/thumbnails/$filename
  index=`expr $index + 1`
done

cd $targetDir

indexFile='index.html'
echo '<!DOCTYPE html>
<html>
<head>
<title>Pictures list</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js"></script>
<script src="galleria.js"></script>
</head>
<body>
<div id="gallery">
' > $indexFile

for f in `ls thumbnails/*`; do 
  image=`echo $f | replace thumbnails pictures`
  echo "<a href=\"$image\" target=\"_blank\"><img src=\"$f\" border=\"0\"></a>" >> $indexFile
done
echo '
<script>
  Galleria.loadTheme("themes/classic/galleria.classic.js");
  $("#gallery").galleria({
    width: 1024,
    height: 768 
  });
</script>
' >> $indexFile
echo "</div>Total: $total pictures</body></html>" >> $indexFile

cd $cdir
echo "Generated $total thumbnails in the directory: $targetDir, source: $sourceDir"
echo "Done.";
