CLASS zcl_abap_calculator DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    CLASS-METHODS calculate_power
      IMPORTING !base         TYPE zabap_decimal
                !exponent     TYPE zabap_decimal DEFAULT 2
      RETURNING VALUE(result) TYPE zabap_decimal
      RAISING   cx_sy_arithmetic_overflow.

ENDCLASS.


CLASS zcl_abap_calculator IMPLEMENTATION.
  METHOD calculate_power.
    result = base ** exponent.
  ENDMETHOD.
ENDCLASS.
