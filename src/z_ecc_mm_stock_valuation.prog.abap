*&---------------------------------------------------------------------*
*& Report Z_ECC_MM_STOCK_VALUATION
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT Z_ECC_MM_STOCK_VALUATION.



TABLES: mard,
        mseg,
        mkpf.

SELECT-OPTIONS:
  s_matnr FOR mard-matnr,
  s_werks FOR mard-werks.

DATA: lv_stock TYPE mseg-menge.

SELECT SUM( mseg~menge )
  INTO lv_stock
  FROM mseg
  INNER JOIN mkpf
    ON mseg~mblnr = mkpf~mblnr
   AND mseg~mjahr = mkpf~mjahr
  WHERE mseg~matnr IN s_matnr
    AND mseg~werks IN s_werks.

WRITE: / 'Total Stock Quantity:', lv_stock.
