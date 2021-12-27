echo "March 10"
awk '/0[58].+ AM|(0[28]|11).+ PM/ {print $1,$2,$5,$6}' 0310_Dealer_schedule

