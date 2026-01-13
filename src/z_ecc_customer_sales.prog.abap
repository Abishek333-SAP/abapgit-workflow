REPORT Z_ECC_CUSTOMER_SALES.

SELECT-OPTIONS: s_kunnr FOR kunnr.

SELECT FROM kna1
   INNER JOIN knvv ON kna1~kunnr = knvv~kunnr
   FIELDS kunnr, name1, vkorg, vtweg, spart
   WHERE kunnr IN @s_kunnr
   INTO TABLE @DATA(result).

LOOP AT result INTO DATA(line).
  WRITE: / line-kunnr, line-name1, line-vkorg, line-vtweg, line-spart.
ENDLOOP.