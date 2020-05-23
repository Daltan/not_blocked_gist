set-variable date_of_today (get-date -UFormat "%Y年%m月%d日")
Set-Variable dayofyear "$([int](([int](get-date -UFormat "%j")/365)*100))%"
set-Variable weekofyear "第$([int](get-date -UFormat "%V"))周"
Set-Variable dayofweek1 (Get-Date -UFormat "%u")
set-variable dayofweek (Get-Culture).DateTimeFormat.AbbreviatedDayNames[$dayofweek1]
write-output "$date_of_today $weekofyear$dayofweek $dayofyear"
