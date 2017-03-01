 package com.instrument.domain;

public class Instrument {
    private String barcode;

    private String instrumentphoto;

    private String instrumentname;

    private String instrumenttype;

    private Integer count;

    private String date;

    public String getBarcode() {
        return barcode;
    }

    public void setBarcode(String barcode) {
        this.barcode = barcode == null ? null : barcode.trim();
    }

    public String getInstrumentphoto() {
        return instrumentphoto;
    }

    public void setInstrumentphoto(String instrumentphoto) {
        this.instrumentphoto = instrumentphoto == null ? null : instrumentphoto.trim();
    }

    public String getInstrumentname() {
        return instrumentname;
    }

    public void setInstrumentname(String instrumentname) {
        this.instrumentname = instrumentname == null ? null : instrumentname.trim();
    }

    public String getInstrumenttype() {
        return instrumenttype;
    }

    public void setInstrumenttype(String instrumenttype) {
        this.instrumenttype = instrumenttype == null ? null : instrumenttype.trim();
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date == null ? null : date.trim();
    }

}