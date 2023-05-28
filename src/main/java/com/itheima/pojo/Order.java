package com.itheima.pojo;

public class Order {
    private int oid;
    private int gid;
    private int amount;
    private String address;
    private double price;
    private String situation;
    private int consumer;
    private int uid;

    public void setUid(int uid) {
        this.uid = uid;
    }

    public int getUid() {
        return uid;
    }

    public void setConsumer(int consumer) {
        this.consumer = consumer;
    }

    public int getConsumer() {
        return consumer;
    }

    public void setSituation(String situation) {
        this.situation = situation;
    }

    public String getSituation() {
        return situation;
    }

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

    @Override
    public String toString() {
        return "Order--->"+oid+","+gid+","+amount+","+address+","+price+","+situation;
    }
}
