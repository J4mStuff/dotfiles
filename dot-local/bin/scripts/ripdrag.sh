echo $@ | sed -E 's/( [A-Za-z0-9])/\\\1/g' | xargs ripdrag
