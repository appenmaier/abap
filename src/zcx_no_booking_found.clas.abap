CLASS zcx_no_booking_found DEFINITION
  PUBLIC
  INHERITING FROM cx_static_check
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_t100_dyn_msg.
    INTERFACES if_t100_message.

    CONSTANTS:
      BEGIN OF zcx_no_booking_found,
        msgid TYPE symsgid      VALUE 'ZABAP',
        msgno TYPE symsgno      VALUE '001',
        attr1 TYPE scx_attrname VALUE 'CARRIER_ID',
        attr2 TYPE scx_attrname VALUE 'CONNECTION_ID',
        attr3 TYPE scx_attrname VALUE 'FLIGHT_DATE',
        attr4 TYPE scx_attrname VALUE 'BOOKING_ID',
      END OF zcx_no_booking_found.

    CONSTANTS:
      BEGIN OF zcx_no_booking_found2,
        msgid TYPE symsgid      VALUE 'ZABAP',
        msgno TYPE symsgno      VALUE '002',
        attr1 TYPE scx_attrname VALUE 'CUSTOMER_ID',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF zcx_no_booking_found2.

    METHODS constructor
      IMPORTING !previous     LIKE previous   OPTIONAL
                carrier_id    TYPE s_carr_id  OPTIONAL
                connection_id TYPE s_conn_id  OPTIONAL
                flight_date   TYPE s_date     OPTIONAL
                booking_id    TYPE S_book_id  OPTIONAL
                customer_id   TYPE s_customer OPTIONAL.

    DATA carrier_id    TYPE s_carr_id.
    DATA connection_id TYPE s_conn_id.
    DATA flight_date   TYPE s_date.
    DATA booking_id    TYPE S_book_id.
    DATA customer_id   TYPE s_customer.

  PROTECTED SECTION.

  PRIVATE SECTION.

ENDCLASS.


CLASS zcx_no_booking_found IMPLEMENTATION.
  METHOD constructor ##ADT_SUPPRESS_GENERATION.
    super->constructor( previous = previous ).
    IF customer_id IS INITIAL.
      if_t100_message~t100key = zcx_no_booking_found.
    ELSE.
      if_t100_message~t100key = zcx_no_booking_found2.
    ENDIF.
    me->carrier_id    = carrier_id.
    me->connection_id = connection_id.
    me->flight_date   = flight_date.
    me->booking_id    = booking_id.
    me->customer_id   = customer_id.
  ENDMETHOD.
ENDCLASS.
