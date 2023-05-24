package com.itheima.pojo;

public class Order {
    private int oid;
    private int gid;
    private int amount;
    private String address;
    private double price;

    public void setPrice(double price) {
        this.price = price;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public int getGid() {
        return gid;
    }

    public void setGid(int gid) {
        this.gid = gid;
    }

    public double getPrice() {
        return price;
    }

    public int getOid() {
        return oid;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public void setOid(int oid) {
        this.oid = oid;
    }
}
