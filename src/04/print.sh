#!/bin/bash

echo -e "$BG_BEF$FT_BEF Hostname\033[0m: $BG_AF$FT_AF$HOSTNAME\033[0m"
echo -e "$BG_BEF$FT_BEF Timezone\033[0m: $BG_AF$FT_AF$TIMEZONE UTC $UTC\033[0m"
echo -e "$BG_BEF$FT_BEF User\033[0m: $BG_AF$FT_AF$USER\033[0m"
echo -e "$BG_BEF$FT_BEF Type\033[0m: $BG_AF$FT_AF$TYPE\033[0m"
echo -e "$BG_BEF$FT_BEF Version $Version\033[0m: $BG_AF$FT_AF$VERSION\033[0m"
echo -e "$BG_BEF$FT_BEF Date\033[0m: $BG_AF$FT_AF$DATE\033[0m"
echo -e "$BG_BEF$FT_BEF Uptime\033[0m: $BG_AF$FT_AF$UPTIME\033[0m"
echo -e "$BG_BEF$FT_BEF Uptime in sec\033[0m: $BG_AF$FT_AF up $UPTIME_SEC\033[0m"
echo -e "$BG_BEF$FT_BEF IP\033[0m: $BG_AF$FT_AF$IP\033[0m"
echo -e "$BG_BEF$FT_BEF Netmask\033[0m: $BG_AF$FT_AF$NETMASK\033[0m"
echo -e "$BG_BEF$FT_BEF Gateway\033[0m: $BG_AF$FT_AF$GATEWAY\033[0m"
echo -e "$BG_BEF$FT_BEF Total RAM\033[0m: $BG_AF$FT_AF$RAM_TOTAL\033[0m"
echo -e "$BG_BEF$FT_BEF Used RAM\033[0m: $BG_AF$FT_AF$RAM_USED\033[0m"
echo -e "$BG_BEF$FT_BEF Free RAM\033[0m: $BG_AF$FT_AF$RAM_FREE\033[0m"
echo -e "$BG_BEF$FT_BEF SPACE_ROOT\033[0m: $BG_AF$FT_AF$SPACE_TOTAL\033[0m"
echo -e "$BG_BEF$FT_BEF SPACE_ROOT_USED\033[0m: $BG_AF$FT_AF$SPACE_USED\033[0m"
echo -e "$BG_BEF$FT_BEF SPACE_ROOT_FREE\033[0m: $BG_AF$FT_AF$SPACE_FREE\033[0m"
echo ""
if [[ DEF_1_FLAG -eq 1 ]]; then
    echo "Column 1 background = default (WHITE)"
else
    echo "Column 1 background = $1 ($COLOR_BG_BEF)"
fi

if [[ DEF_2_FLAG -eq 1 ]]; then
    echo "Column 1 font color = default (RED)"
else
    echo "Column 1 font color = $2 ($COLOR_FT_BEF)"
fi

if [[ DEF_3_FLAG -eq 1 ]]; then
    echo "Column 2 background = default (WHITE)"
else
    echo "Column 2 background = $3 ($COLOR_BG_AF)"
fi

if [[ DEF_4_FLAG -eq 1 ]]; then
    echo "Column 2 font color = default (RED)"
else
    echo "Column 2 font color = $4 ($COLOR_FT_AF)"
fi