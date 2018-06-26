for F in `cat ip.txt`
do 
  echo "get diag"
  curl -L http://$F:61621/diagnostics > diagnostics-$F.tar.gz
done  