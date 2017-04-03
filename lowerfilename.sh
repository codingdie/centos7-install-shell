DIR=/opt/projects/web/php/Ikouqin-Server/application/models/

for file in `ls ${DIR} | grep '[A-Z]'`
do
str=`echo $file|tr 'A-Z' 'a-z'`
mv ${DIR}/$file ${DIR}/$str
done
