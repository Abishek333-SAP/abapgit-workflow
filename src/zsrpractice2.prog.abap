*&---------------------------------------------------------------------*
*& Report ZSRPRACTICE2
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zsrpractice2.

TABLES: vbak.

TYPES: BEGIN OF ts_vbak,
         vbeln TYPE vbak-vbeln,
         erdat TYPE vbak-erdat,
         erzet TYPE vbak-erzet,
         ernam TYPE vbak-ernam,
         angdt TYPE vbak-angdt,
         bnddt TYPE vbak-bnddt,
       END OF ts_vbak.

DATA: TT_vbak TYPE TABLE OF ts_vbak,
      wa_vbak TYPE ts_vbak.

data: IT_FCAT type slis_t_fieldcat_alv,
      wa_fcat like LINE OF it_fcat.

SELECT-OPTIONS: s_vbeln FOR vbak-vbeln.
PARAMETERS:p_ernam TYPE ernam.

INITIALIZATION.
p_ernam = 'sakthi'.

APPEND VALUE #( sign = 'I'
                option = 'BT'
                low = '2300'
                high = '9000' ) to s_vbeln[].

START-OF-SELECTION.

  SELECT vbeln
  erdat
  erzet
  ernam
  angdt
  bnddt from vbak INTO TABLE TT_vbak UP TO 100 ROWS WHERE vbeln in s_vbeln.
end-of-SELECTION.

wa_fcat-fieldname = 'vbeln'.
wa_fcat-seltext_m = 'doc num'.
APPEND wa_fcat to it_fcat.
clear wa_fcat.

CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
 EXPORTING
   IT_FIELDCAT                       = it_fcat

 TABLES
    t_outtab                          = tt_vbak
          .
IF sy-subrc <> 0.
* Implement suitable error handling here
ENDIF.


*
*TYPES: BEGIN OF ts_vbap,
*        vbeln TYPE vbap-vbeln,
*        posnr TYPE vbap-posnr,
*        matnr TYPE vbap-matnr,
*        matwa TYPE vbap-matwa,
*        pmatn TYPE vbap-pmatn,
*      END OF ts_vbap.
*
*DATA: TT_vbap TYPE table of ts_vbap,
*      wa_vbap TYPE ts_vbap.
