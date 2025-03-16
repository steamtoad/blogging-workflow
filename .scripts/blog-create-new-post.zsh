read -p 'Please enter the subject line: ' subject
cd ~/pub/blog/posts

fname=$(uuid).adoc

echo '*' $(date +"%H.%M") - link:../../posts/$fname[$subject]  >> ~/pub/blog/contents/daily/$(date +"%Y-%m-%d").adoc
echo '*' $(date +"%d-%m-%Y %H.%M") - link:../../posts/$fname[$subject]  >> ~/pub/blog/contents/monthly/$(date +"%Y-%m").adoc
echo '*' $(date +"%d-%m-%Y %H.%M") - link:../../posts/$fname[$subject]  >> ~/pub/blog/contents/yearly/$(date +"%Y").adoc

echo '=' $subject '-' $(date +"%d-%m-%Y") >> ~/pub/blog/posts/$fname
echo ':author:' $(whoami) >> ~/pub/blog/posts/$fname
echo ':created:' $(date +"%Y-%m-%d %H:%M:%S") >> ~/pub/blog/posts/$fname
echo ':lang: (en)' >> ~/pub/blog/posts/$fname
echo ':copyright: Copyright (c)' $(date +"%Y") 'Aleksandr A. Kharin. All rights reserved.' >> ~/pub/blog/posts/$fname
echo '' >> ~/pub/blog/posts/$fname
echo 'Write your Asciidoc content here' >> ~/pub/blog/posts/$fname 
echo '' >> ~/pub/blog/posts/$fname
echo 'link:'$(cat ~/pub/blog/.state/last-file)'[Previous post]' >> ~/pub/blog/posts/$fname

echo ' | link:'$fname'[Next post]' >> ~/pub/blog/posts/$(cat ~/pub/blog/.state/last-file)
echo '*' $(date +"%d-%m-%Y %H.%M") '- link:'posts/$fname'['$subject']' > ~/pub/blog/recent-entry.adoc

echo $fname > ~/pub/blog/.state/last-file

vim $fname








