CLASS zcl_abap_helper DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    CLASS-METHODS get_customer
      IMPORTING customer_id     TYPE s_customer
      RETURNING VALUE(customer) TYPE zabap_customer
      RAISING   zcx_no_customer_found.

    CLASS-METHODS get_booking
      IMPORTING carrier_id     TYPE s_carr_id
                connection_id  TYPE s_conn_id
                flight_date    TYPE s_date
                booking_id     TYPE s_book_id
      RETURNING VALUE(booking) TYPE zabap_booking
      RAISING   zcx_no_booking_found.

    CLASS-METHODS get_bookings
      IMPORTING customer_id     TYPE s_customer
      RETURNING VALUE(bookings) TYPE zabap_bookings
      RAISING   zcx_no_booking_found.

ENDCLASS.


CLASS zcl_abap_helper IMPLEMENTATION.
  METHOD get_customer.
    SELECT SINGLE
      FROM scustom
      FIELDS id, name, city, country
      WHERE id = @customer_id
      INTO @customer.
    IF sy-subrc <> 0.
      RAISE EXCEPTION NEW zcx_no_customer_found( customer_id = customer_id ).
    ENDIF.
  ENDMETHOD.

  METHOD get_booking.
    SELECT SINGLE
      FROM sbook
      FIELDS carrid, connid, fldate, bookid, customid, custtype, smoker, forcuram, forcurkey
      WHERE carrid = @carrier_id AND connid = @connection_id AND fldate = @flight_date AND bookid = @booking_id
      INTO @booking.
    IF sy-subrc <> 0.
      RAISE EXCEPTION NEW zcx_no_booking_found( carrier_id    = carrier_id
                                                connection_id = connection_id
                                                flight_date   = flight_date
                                                booking_id    = booking_id ).
    ENDIF.
  ENDMETHOD.

  METHOD get_bookings.
    SELECT
      FROM sbook
      FIELDS carrid, connid, fldate, bookid, customid, custtype, smoker, forcuram, forcurkey
      WHERE customid = @customer_id
      INTO TABLE @bookings.
    IF sy-subrc <> 0.
      RAISE EXCEPTION NEW zcx_no_booking_found( customer_id = customer_id ).
    ENDIF.
  ENDMETHOD.
ENDCLASS.
