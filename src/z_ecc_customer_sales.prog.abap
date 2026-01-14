REPORT Z_ECC_CUSTOMER_SALES.

*
*SELECT-OPTIONS: s_kunnr FOR kna1-kunnr.
*
*SELECT FROM kna1
*   INNER JOIN knvv ON kna1~kunnr = knvv~kunnr
*   FIELDS kunnr, name1, vkorg, vtweg, spart
*   WHERE kunnr IN @s_kunnr
*   INTO TABLE @DATA(result).
*
*LOOP AT result INTO DATA(line).
*  WRITE: / line-kunnr, line-name1, line-vkorg, line-vtweg, line-spart.
*ENDLOOP.

*Error Log

*// ?@5C\QError@  3 Program Z_ECC_CUSTOMER_SALES
*//   Field "KUNNR" is unknown.


DATA gv_kunnr TYPE kna1-kunnr.
SELECT-OPTIONS s_kunnr FOR gv_kunnr.

SELECT
    kna1~kunnr,
    kna1~name1,
    knvv~vkorg,
    knvv~vtweg,
    knvv~spart
  FROM kna1
  INNER JOIN knvv
    ON kna1~kunnr = knvv~kunnr
  INTO TABLE @DATA(result)
  WHERE kna1~kunnr IN @s_kunnr.

LOOP AT result INTO DATA(line).
  WRITE: / line-kunnr,
           line-name1,
           line-vkorg,
           line-vtweg,
           line-spart.
ENDLOOP.
